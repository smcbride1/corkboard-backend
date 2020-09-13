module ApplicationHelper
    def current_user
        User.find(session[:user_id]) if session.has_key?(:user_id)
    end
    def logged_in?
        current_user
    end
    def error_message(message) {
        {error: true, message: message}.to_json()
    }
end