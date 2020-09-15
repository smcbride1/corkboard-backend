class SessionsController < ApplicationController
    def create #login action
        if auth
            user = User.find_or_create_by(facebook_uid: auth["uid"]) do |u|
                u.name = auth["info"]["name"]
                u.email = auth["info"]["email"]
                u.password = SecureRandom.hex
            end
            session[:user_id] = user.id
            render json: UserSerializer.new(user).to_serialized_json
            # else
            #     render error_message("Something went wrong. Please make sure that you don't already have an account with this account's email address.")
            # end
        else
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                render json: UserSerializer.new(user).to_serialized_json
            else
                render json: error_message("Invalid email or password.")
            end
        end
    end

    def destroy #logout
        session.destroy
    end
    
    def current_user_info
        if current_user
            render json: UserSerializer.new(current_user).to_serialized_json
        else
            render json: error_message("Not logged in.")
        end
    end

    def auth
        request.env['omniauth.auth']
    end
end
