class ArticlesController < ApplicationController
  before_action :set_article_id
  def index
    #@catalog = Catalog.find(params[:catalog_id])
    @articles = @catalog.articles.all
    #Rails.logger.debug "#{@article.inspect}"
    #render json: {article: @article}, status: :ok
    render json: {article: response_data('articles', @articles)}, status: :ok
  
  end

  def create
    #@catalog = Catalog.find(params[:catalog_id])
    if params.has_key?('article') and params.keys[0] == @catalog.ctype
      @article= @catalog.articles.new(article_params)
      if @article.save
        render json: {status: 'SUCECESS', message: 'article saved', data: @article}, status: :ok
      else
        render json: {status: 'UnSUCECESS', message: 'article not saved', data: @article.errors}, status: :unprocessable_entity 
      end
    else 
      render json: {status: 'unsucess'}, status: :unprocessable_entity  
    end
  end

  def show
    #@article = @catalog.articles.includes(:comments).find(params[:id])
    @article = @catalog.articles.find(params[:id])
    @comments = @article.comments.all #select(:comment_body)
    article ={}
    article[:article] = @article
    article[:comments] = response_data('comments', @comments)
    #@a = @article.(include: @comments.comment_body)
    render json: { data: article}, status: :ok

    # render json: {article: response_data('articles', @article)}, status: :ok
    # render json: {article: {@article, comments: @comments}}, status: :ok
    #render json: {article: @article, comments: @article.comments}, status: :ok
  end

  def destroy
    @article = @catalog.articles.find(params[:id])
    if @article.destroy
      render json: {message: "sucessfully deleted" }, status: :ok
    else
      render json: {message: 'unable to delete' }, status: :unprocessable_entity
    end
  end

  def update
    @article = @catalog.articles.find(params[:id])
    if @article.update(article_params)
      render json: {status: 'SUCECESS', message: 'article saved', data: @article}, status: :ok
    else 
      render json: {status: "Error", }, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :long_description, :short_description, :status  )
  end

  def set_article_id
    @catalog = Catalog.find(params[:catalog_id])
  end
end
