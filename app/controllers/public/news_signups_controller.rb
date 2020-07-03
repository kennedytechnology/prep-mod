class Public::NewsSignupsController < InheritedResources::Base
  def new
    @news_signup = NewsSignup.new()
  end

  def create
    @news_signup = NewsSignup.new(news_signup_params)

    if @news_signup.save
      NewsSignupMailer.successful_signup(@news_signup).deliver
      redirect_to root_path, notice: "Successfully signed up!"
    else
      render :new
    end
  end

  private
    def news_signup_params
      params.require(:news_signup).permit(
        :first_name, :last_name, :email, :date_of_birth, :zip_code, 
        :occupation, :chronic_health_condition,
        :signatory_first_name, :signatory_last_name,
        topics: []
      )
    end
end
