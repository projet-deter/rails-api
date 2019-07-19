# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]
   # POST /register
    def register
      @user = User.create(user_params)
     if @user.save
      response = { message: 'User created successfully'}

      render json: response, status: 201 

     else
      render json: @user.errors, status: :bad
     end
    end

    def login
      authenticate params[:email], params[:password]
    end

    private

    def user_params
      params.permit(
        :name,
        :email,
        :password
      )
    end

    def authenticate(email, password)

      command = AuthenticateUser.call(email, password)

      if command.success?
        @user = User.find_by(email: params[:email])
        render json: {
          id: @user.id,
          name: @user.name,
          email: @user.email,
          access_token: command.result,
          message: 'Login Successful'
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
     end
  end
