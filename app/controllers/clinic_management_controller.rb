
class ClinicManagementController < ApplicationController
  layout "clinic_management"
  before_action :authenticate_user!
  
end
