class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
    def sale_reminder_email(user)
        @user = user
        mail(to: @user.email, subject: 'Remember you can put up products for sale on our site!')
    end
end
