class PublicPortalController < ApplicationController
  def index
    session[:patient_id] = nil
    session[:client] = nil
    render template_for_homepage
  end
end
