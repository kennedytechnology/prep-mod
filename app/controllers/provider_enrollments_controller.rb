class ProviderEnrollmentsController < ApplicationController
  layout "clinic_management"

  def index
    @provider_enrollments = ProviderEnrollment.all
    @provider_enrollment = ProviderEnrollment.new
  end

  def new
  end
end
