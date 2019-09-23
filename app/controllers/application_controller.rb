class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    def response_data(type, obj)
        data = {}
        data[:type] = type
        data[:count] = obj.count
        data[:data] = obj.as_json(only: response_fields(type))
	    data
    end

    def response_fields(type)
        response_fields_array = case type
                                when 'catalogs'
                                    [:id, :ctype, :name]
                                when 'playlists'
                                    [:id, :name, :title]
                                when 'comments'
                                    [:comment_body]
                                when 'articles'
                                    [:id, :title, :short_description, :long_description, :status, :catalog_id]
                                end
    end
end
