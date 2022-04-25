class CompaniesController < ApplicationController
    def index
        @companies = Company.all
    end

    def show
        if !user_signed_in?
            redirect_to new_user_session_path
        else
            @user = current_user
            company_id = params[:id]
            FetchCompanyOverviewJob.perform_now(company_id)
            FetchCompanyPricesJob.perform_now(company_id)
            FetchTimeSeriesJob.perform_now(company_id)
            
            @company = Company.find(company_id)            
        end
    end
end
