class ApplicationController < ActionController::API
    include ::ActionController::Cookies
    
    def authorized?(user_id = nil)
        if !session.has_key(:user_id) || 
    end
end
