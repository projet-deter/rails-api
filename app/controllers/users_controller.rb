# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end

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
        render json: { error: command.errors }, status: 401
      end
   end

   def show
     @user = User.find_by(id: params[:id])

     render json: @user, status: 200
   end

   def update
       @user = User.find_by_id!(params[:id])

       if @user.id == current_user.id

         @user.update_attributes(user_params)

         render json: @user, status: 200
       else
         render json: { errors: { article: ['not owned by user'] } }, status: :forbidden
       end
   end

   def destroy
       @user = User.find_by_id!(params[:id])

       if @user.id == current_user.id
         @user.destroy

         render json: {message: "Deleted"}
       else
         render json: { errors: { article: ['not owned by user'] } }, status: :forbidden
       end
   end


  end
