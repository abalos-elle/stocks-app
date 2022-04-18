class TransactionsController < ApplicationController
    access all: [:sell, :create]

    def sell    
        # @owned_stock = OwnedStock.find(params[:owned_stock_id])      
        @transaction = Transaction.new
    end   

    def create
        @transaction = Transaction.new(params.require(:transaction).permit(:quantity, :price))
        
        if @transaction.save
            redirect_to @transaction
        else
            render :new, locals: { error: 1, notice: 'Error on article creation' }
        end
    end
end
