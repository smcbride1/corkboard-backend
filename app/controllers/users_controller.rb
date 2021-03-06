class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if !user.valid?
            render json: error_message("Unable to create new user: #{user.errors}")
        else
            user.save
            session[:user_id] = user.id
            render json: UserSerializer.new(user).to_serialized_json
        end
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user).to_serialized_json
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: UserSerializer.new(user).to_serialized_json
    end

    def destroy
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
