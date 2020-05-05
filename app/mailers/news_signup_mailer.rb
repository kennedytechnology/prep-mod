class NewsSignupMailer < ApplicationMailer
  def successful_signup(news_signup)
    @news_signup = news_signup
    mail(to: news_signup.email, subject: 'Thank you for your subscription')
  end
end
