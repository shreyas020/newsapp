class CommentsController < ApplicationController
    #before_action :set_comment_id
    # def index
    #     #@catalog = Catalog.find(params[:catalog_id])
    #     #@article = @catalog.articles.find(params[:article_id])
    #     @comments = @article.comments.last
       
    #     render json: {comment: @comments }, status: :ok
    # end
    # def new 
    #     @comment = @commentable.comments.new
    # end
    def create
        @comment = @commentable.comments.new(comment_params)
        if @comment.save
            render json: { data: @comment}, status: :ok
        else
          render json: {data: @article.errors}, status: :unprocessable_entity 
        end

    end

    private
    # def set_comment_id
    #     @catalog = Catalog.find(params[:catalog_id])
    #     @article = @catalog.articles.find(params[:article_id])
    # end

    def comment_params
        params.require(:comments).permit( :comment_body)
    end
end
