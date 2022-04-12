module ApplicationHelper
    def custom_javascript_packs
        javascript_pack_tag params[:controller], 'data-turbolinks-track': 'reload'
    rescue Webpacker::Manifest::MissingEntryError
    end

    def number_to_currency_p(number)
        number_to_currency(number, unit: "$ ")
    end
    
end
