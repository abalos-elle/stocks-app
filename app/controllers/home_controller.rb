class HomeController < ApplicationController
  before_action :unapproved
  
  def index
    # @companies = Company.where("latest_price is not null")
    @q = Company.select([:name, :ticker, :latest_price, :previous_close]).ransack(params[:q])
    @companies = @q.result(distinct: true)
    @all_companies = Company.all
  end

  private
  def unapproved
    if user_signed_in?
      @user = current_user      
      @companies_top_5 = Company.get_top_5
      @companies_bottom_5 = Company.get_bottom_5        
    else
      redirect_to new_user_session_path
    end
  end
end
