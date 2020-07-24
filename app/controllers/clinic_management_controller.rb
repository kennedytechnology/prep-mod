class ClinicManagementController < ApplicationController
  before_action :authenticate_user!
  layout "clinic_management"
end
