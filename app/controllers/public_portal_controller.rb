class PublicPortalController < ApplicationController
  def index
    session[:patient_id] = nil
    session[:client] = nil
  end

  def index2
    session[:patient_id] = nil
    session[:client] = nil
  end
end
