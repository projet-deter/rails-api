class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :create, :update, :destroy]

  def category_params
    params.require(:category).permit(:name)
  end

  def index
    @categories = Category.all

    render json: @categories, status: 200
  end

  def create
      @category = Category.find_by(name: params[:name])

      if @category == nil
        @category = Category.new(category_params)

        if @category.save
          @category = Category.find_by(name: params[:name])

          render json: @category, status: 201
        else
          render json: { errors: @category.errors }, status: :unprocessable_entity
        end
      else
        render json: { message: "Category exists" }

      end
    end

    def update
      @category = Category.find_by(name: params[:name])

          @category.update_attributes(category_params)
    end

    def destroy
        @category = Category.find_by_id!(params[:id])

        #To Do : add condition for admin only authorized to delete a category
          @category.destroy

          render json: {message: "Category deleted"}
    end

end
