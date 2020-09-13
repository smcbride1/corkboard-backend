class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if !user.valid?
            render error_message("Unable to create new user: #{user.errors}")
        else
            user.save
            render json: UserSerializer.new(user).to_serialized_json
        end
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user).to_serialized_json
    end

    def edit
        user = User.find(params[:id])
        render json: UserSerializer.new(user).to_serialized_json
    end

    def destroy
    end

    def user_params
        params.require(:user).permit(:name, :email, :password_digest)
    end
end
