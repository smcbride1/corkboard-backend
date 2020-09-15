class UserSerializer
    def initialize(user_object)
      @user = user_object
    end
  
    def to_serialized_json
      @user.to_json(
        only: [:user_id, :name, :email]
      )
    end
  end
  