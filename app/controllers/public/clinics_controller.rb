class Public::ClinicsController < ApplicationController
  
  def index
    @clinics = []
  end

  def search
    @clinics = Clinic.all
    if params[:location].present?
      params[:search_radius] = 999 if params[:search_radius] == "All"
      @clinics = @clinics.near(params[:location], params[:search_radius].to_i, order: :distance)
    end
    if params['age_group']
      @clinics = @clinics.select{|clinic| (clinic.age_groups.collect(&:name) & params['age_group']).any?  }
    end
    if params['service']
      @clinics = @clinics.select{|clinic| (clinic.services.collect(&:name) & params['service']).any?  }
    end
    render :index   
  end

 
end
