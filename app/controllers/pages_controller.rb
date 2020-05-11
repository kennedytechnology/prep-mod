class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:landing_page]

  def landing_page
  end
end
