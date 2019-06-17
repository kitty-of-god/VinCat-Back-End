class ProductMailer < ApplicationMailer
    def new_product(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome back')
    end
end
