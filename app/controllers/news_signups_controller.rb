class NewsSignupsController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"

  def index
    respond_to do |format|
      format.csv { send_data NewsSignup.all.to_csv, filename: "news_signups-#{Date.today}.csv" }
    end
  end
end