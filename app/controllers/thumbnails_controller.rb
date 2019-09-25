class ThumbnailsController < ApplicationController
    before_action :set_thumbnail_id

    def index
        @thumbnails = @article.thumbnails.last
        render json: {data: @thumbnails }, status: :ok
    end
    def new
        @thumbnail = @thumbnailable.thumbnails.new
    end
    def create
        @thumbnail = @thumbnailable.thumbnails.new thumbnail_params
        #@thumbnail = @article.thumbnails.new(thumbnail_params)
        if @thumbnail.save
            render json: { data: @thumbnail}, status: :ok
        else
          render json: {data: @thumbnail.errors}, status: :unprocessable_entity 
        end
    end
    private
    def set_thumbnail_id
        #@catalog = Catalog.find(params[:catalog_id])
        @article = Articles.find(params[:article_id])
    end

    def thumbnail_params
        params.require(:thumbnail).permit( :url)
    end
end