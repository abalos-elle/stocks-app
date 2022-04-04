class HomeController < ApplicationController
  def index
    @companies = Company.where("latest_price is not null")
  end
end
