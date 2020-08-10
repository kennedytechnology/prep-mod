class NewsSignupMailer < ApplicationMailer
  def successful_signup(news_signup)
    @news_signup = news_signup

    I18n.with_locale(locale) do
      mail(to: news_signup.email)
    end
  end
end
