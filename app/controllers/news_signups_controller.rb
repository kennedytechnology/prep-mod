class NewsSignupsController < InheritedResources::Base
  actions :new, :create

  private
    def news_signup_params
      params.require(:news_signup).permit(:name, :email)
    end
end
