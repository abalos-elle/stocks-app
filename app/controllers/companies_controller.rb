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
            # FetchCompanyOverviewJob.perform_now(company_id)
            # FetchCompanyPricesJob.perform_now(company_id)
            # FetchTimeSeriesJob.perform_now(company_id)
            
            @company = Company.find(company_id)    
            timeseries = Hash.new
            @data_keys = []
            @data_values = []

            @company.prices.each do |key,value|
                if key=="Time Series (5min)"
                    value.each do |key2, value2|
                        timeseries[key2] = value2["4. close"]   
                        @data_keys.push(key2)
                        @data_values.push(value2["4. close"])
                    end                    
                end
            end 

            #reverse array elements to show earlier dates
           @data_keys.reverse!
           @data_values.reverse!
            
        end
    end
end
