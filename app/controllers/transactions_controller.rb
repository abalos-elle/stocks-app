class TransactionsController < ApplicationController
    before_action :set_user
    
    def index
        @transactions = Transaction.where("user_id = #{@user.id}")   
    end

    def new
        @transaction = Transaction.new

        # Types: 1 - Buy, 2 - Sell
        @type = params[:type].to_i
        @stock = params[:stock]

        if @type == 1
            @company_id = params[:company_id]
            @company_name = Company.find(@company_id).name
            @quantity = 0            
        elsif @type == 2
            @company_id = OwnedStock.find(@stock).company_id
            @company_name = OwnedStock.find(@stock).company.name
            @quantity = OwnedStock.find(@stock).quantity
            @current_price = Company.find(@company_id).latest_price
        end
              
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create      
        @transaction = Transaction.new(params.require(:transaction).permit(:type, :company_id, :user_id, :quantity, :price))
        d = DateTime.now
        @transaction.code = d.strftime("%Y%m%d%H%M%s")
        
        if @transaction.save
            type = params[:transaction][:type].to_i
            os = OwnedStock.find_by(company_id: @transaction.company_id)
            
            if os.nil?
                os = OwnedStock.new(user_id: @user.id, company_id: @transaction.company_id, quantity: params[:transaction][:quantity], price: params[:price])                
            else
                if type == 1
                    os.quantity += @transaction.quantity
                elsif type == 2
                    os.quantity -= @transaction.quantity
                end
            end
            os.save
            redirect_to @transaction
        else
            render :new, locals: { error: 1, notice: 'Error on article creation' }
        end
    end

    private

    def set_user
        if !user_signed_in?
            redirect_to new_user_session_path
        else
            @user = current_user           
        end
    end
end
