class NewsSignupMailer < ApplicationMailer
  default from: 'info@clinicwizard.com'

  def successful_signup(news_signup)
    @news_signup = news_signup
    mail(to: news_signup.email, subject: 'Thank you for your subscription')
  end
end
