class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :create, :update, :destroy]
  before_action :find_article!



  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_article!
    @article = Article.find_by_id!(params[:article_id])
  end

  def index
    @comments = @article.comments.order(created_at: :desc)

    render json: @comments
  end

  def show
    @comments = @article.comments.order(created_at: :desc)
    @comment = Comment.find(params[:id])
    render json: @comments
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    render json: { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.destroy
      render json: {}
    else
      render json: { errors: { comment: ['not owned by user'] } }, status: :forbidden
    end
  end
end