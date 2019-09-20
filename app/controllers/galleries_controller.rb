class GalleriesController < ApplicationController
    before_action :set_article_id
  def index
    #@catalog = Catalog.find(params[:catalog_id])
    @gallery= @catalog.articles.all
    #Rails.logger.debug "#{@article.inspect}"
    #render json: {article: @article}, status: :ok
    render json: {article: response_data('articles', @gallery)}, status: :ok
  
  end

  def create
    #@catalog = Catalog.find(params[:catalog_id])
    if params.has_key?('gallery') and params.keys[0] == @catalog.ctype
      @gallery= @catalog.galleries.new(gallery_params)
      if @gallery.save
        render json: {status: 'SUCECESS', message: 'article saved', data: @gallery}, status: :ok
      else
        render json: {status: 'UnSUCECESS', message: 'article not saved', data: @gallery.errors}, status: :unprocessable_entity 
      end
    else 
      render json: {status: 'unsucess'}, status: :unprocessable_entity  
    end
  end

  def show
    @gallery =@catalog.articles.find(params[:id])
    #render json: {article: response_data('articles', @article)}, status: :ok
    render json: {article: @gallery}, status: :ok
  end

  def destroy
    @gallery = @catalog.articles.find(params[:id])
    if @gallery.destroy
      render json: {message: "sucessfully deleted" }, status: :ok
    else
      render json: {message: 'unable to delete' }, status: :unprocessable_entity
    end
  end

  def update
    @gallery = @catalog.articles.find(params[:id])
    if @gallery.update(gallery_params)
      render json: {status: 'SUCECESS', message: 'article saved', data: @gallery}, status: :ok
    else 
      render json: {status: "Error", }, status: :unprocessable_entity
    end
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :description, :status  )
  end

  def set_article_id
    @catalog = Catalog.find(params[:catalog_id])
  end
end
