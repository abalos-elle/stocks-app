class OwnedStocksController < ApplicationController
    def index
        @owned_stocks = OwnedStock.all
        @user = current_user
    end   
  
end
