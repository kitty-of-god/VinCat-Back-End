class SessionsController < ApplicationController
    def create
        user = User.where(email: params[:email]).first
        
        if user&.valid_password?(params[:password])
            render json: user.as_json(only: [:id ,:email, :authentication_token]), status: :created
            SessionsMailer.sign_in_email(user).deliver_now
        else
            head(:unathorized)
        end
    end
    
    def destroy
        
    end
end