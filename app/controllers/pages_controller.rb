class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:landing_page, :reports_menu]
  layout "clinic_management", only: [:reports_menu]
  layout "clinic_menu", only: [:landing_page]
  def landing_page
  end

  def reports_menu
  end

  def boom
    raise "boom"
  end
end
