class OwnedStocksController < ApplicationController
    def index
        if !user_signed_in?
            redirect_to new_user_session_path
          else
            @user = current_user
            @owned_stocks = OwnedStock.where("user_id = #{@user.id} and quantity <> 0")
        end
    end   
  
end
