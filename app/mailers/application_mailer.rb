class ApplicationMailer < ActionMailer::Base
  default from: 'from@rottenmangoes.com'
 
  def delete_email(user)
    @user = user
    mail(to: @user.email, subject: 'Farewell from Rotten Mangoes')
  end
end
