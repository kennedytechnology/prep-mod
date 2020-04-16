json.extract! news_signup, :id, :name, :email, :created_at, :updated_at
json.url news_signup_url(news_signup, format: :json)
