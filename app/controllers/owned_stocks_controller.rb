class OwnedStocksController < ApplicationController
    def index
        @owned_stocks = OwnedStock.all
    end

    def sell    
        @owned_stock = OwnedStock.find(params[:owned_stock_id])      
        @transaction = Transaction.new
    end   
  
end
