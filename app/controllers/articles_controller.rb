class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :create, :update, :destroy]


    def article_params
      params.require(:article).permit(:id, :title, :body, :description, :category_id)
    end

    def index
        @articles = Article.all.includes(:user)

        @articles = Article.authored_by(params[:author]) if params[:author].present?

        @articles_count = Article.count

        @articles = Article.order(created_at: :desc).offset(params[:offset] || 0).limit(params[:limit] || 20)

        render json: @articles, status: 200

    end

    def create

      @article = Article.find_by(title: params[:title])

      if @article == nil
          @article = Article.new(article_params)
          @article.user = current_user


          if @article.save
            @article = Article.find_by(title: params[:title])

            render json: @article, status: 201
          else
            render json: { errors: @article.errors }, status: :unprocessable_entity
          end
        else
          render json: { message: "Article title taken" }

        end
    end

    def show
        @article = Article.find_by(id: params[:id])

        render json: @article, status: 200
    end

    def update
        @article = Article.find_by_id!(params[:id])

        if @article.user_id == current_user.id

          @article.update_attributes(article_params)

          render json: @article, status: 200
        else
          render json: { errors: { article: ['not owned by user'] } }, status: :forbidden
        end
    end

    def destroy
        @article = Article.find_by_id!(params[:id])

        if @article.user_id == current_user.id
          @article.destroy

          render json: {message: "Deleted"}
        else
          render json: { errors: { article: ['not owned by user'] } }, status: :forbidden
        end
    end




end
