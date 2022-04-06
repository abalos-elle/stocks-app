class HomeController < ApplicationController
  def index
    # @companies = Company.where("latest_price is not null")
    @q = Company.select([:name, :ticker, :latest_price, :previous_close]).ransack(params[:q])
    @companies = @q.result(distinct: true)
  end
end
