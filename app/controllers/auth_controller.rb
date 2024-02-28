class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
        user = User.find_by(username: user_login_params[:username])
        # The .authenticate method comes from the Bcrypt gem
        if user && user.authenticate(user_login_params[:password])
            token = encode_token(user_id: user.id)
            render json:{user: UserSerializer.new(user), jwt: token}, status: :accepted
        else
            render json:{error: auth.errors.full_messages}, status: :unauthorized
        end
    end

    private
    
    def user_login_params
        params.permit(:username,:password)
    end
end
