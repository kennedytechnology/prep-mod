class KitController < ApplicationController
  def new
  end

  def thanks
    flash[:alert] = "Your registration for a COVID-19 Safety Kit has been processed. Thank you."
    redirect_to "/"
  end
end
