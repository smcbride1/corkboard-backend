class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    def encode_token(payload)
        JWT.encode(payload, 's3cr3t')
    end

    def current_user
        User.find(session[:user_id]) if session.has_key?(:user_id)
    end

    def logged_in?
        current_user
    end

    def authorized
        render json: { error: true, message: 'Please log in' }, status: :unauthorized if !logged_in?
    end
    
    def error_message(message) 
        {error: true, message: message}
    end
end
