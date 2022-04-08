class OwnedStocksController < ApplicationController
    def index
        @owned_stocks = OwnedStock.all
    end   
  
end
