class SessionsMailer < ApplicationMailer
    def sign_in_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome back')
    end
end
