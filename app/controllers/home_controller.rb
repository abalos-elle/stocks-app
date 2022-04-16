class HomeController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      @user = current_user      
      @companies_top_5 = Company.get_top_5
      @companies_bottom_5 = Company.get_bottom_5      
    end
  end
end
