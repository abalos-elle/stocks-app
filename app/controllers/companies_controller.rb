class CompaniesController < ApplicationController
    def index
        @companies = Company.all
    end

    def show
        @companies = Company.all
        @company = Company.find(params[:id])
    end
end
