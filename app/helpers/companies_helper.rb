module CompaniesHelper
    def number_to_percent(number)
        ActionController::Base.helpers.number_to_percentage(number, precision: 4)
    end
end
