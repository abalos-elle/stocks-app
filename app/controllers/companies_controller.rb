class CompaniesController < ApplicationController
    def index
        @companies = Company.all
    end

    def show
        if !user_signed_in?
            redirect_to new_user_session_path
        else
            @user = current_user
            @company = Company.find(params[:id])
            @companies = Company.all
        end
    end
end
