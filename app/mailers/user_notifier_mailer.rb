class UserNotifierMailer < ApplicationMailer
  default from: 'my_store.com'

  def welcome(user)
    @user = user
    # @url  = 'http://www.gmail.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
