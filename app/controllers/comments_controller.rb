class CommentsController < ApplicationController
    before_action :set_comment_id
    def index
        #@catalog = Catalog.find(params[:catalog_id])
        #@article = @catalog.articles.find(params[:article_id])
        @comments = @article.comments.last
       
        render json: {comment: @comments }, status: :ok
    end

    def create
        @comment = @article.new(comment_param)
        if comment.save
            render json: { data: @article}, status: :ok
        else
          render json: {data: @article.errors}, status: :unprocessable_entity 
        end

    end

    private
    def set_comment_id
        @catalog = Catalog.find(params[:catalog_id])
        @article = @catalog.articles.find(params[:article_id])
    end

    def comment_param
        params.require(:comments).permit(:comment_body)
    end
end
