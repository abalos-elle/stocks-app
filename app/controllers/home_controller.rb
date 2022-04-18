class HomeController < ApplicationController
  before_action :unapproved
  
  def index
    # @companies = Company.where("latest_price is not null")
    @q = Company.select([:name, :ticker, :latest_price, :previous_close]).ransack(params[:q])
    @companies = @q.result(distinct: true)
  end

  private
  def unapproved
    if user_signed_in?
      user = current_user
      if user.has_roles?(:trader, :user) && !user.is_approved
        redirect_to forbidden_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
