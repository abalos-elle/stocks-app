module ApplicationHelper
    def active_class(path)
        request.path === path ? 'active' : 'text-white'
    end

    def custom_js
        javascript_pack_tag "#{params[:controller]}/#{params[:action]}", 'data-turbolinks-track': 'reload'
    rescue Webpacker::Manifest::MissingEntryError
    end
end
