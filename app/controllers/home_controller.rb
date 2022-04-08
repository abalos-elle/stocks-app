class HomeController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      @user = current_user
      # @companies = Company.where("latest_price is not null")
      @q = Company.select([:name, :ticker, :latest_price, :previous_close]).ransack(params[:q])
      @companies = @q.result(distinct: true)
    end
  end
end
