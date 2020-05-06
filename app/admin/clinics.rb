ActiveAdmin.register Clinic do

  permit_params :clinic_date, :venue_id, :lead_vaccinator_name,
    :students_registered, :clinic_status, :user_id, :outcome_comments,
    :incidents_comments, :start_time, :end_time, :duration, user_ids: []

  filter :clinic_date
  filter :venue
  filter :lead_vaccinator_name
  filter :students_registered
  filter :clinic_status
  
  index do
    selectable_column
    id_column
    column :clinic_date
    column :venue
    column :place_name
    column :lead_vaccinator_name
    column :students_registered
    column :clinic_status
    actions
  end

  # Add or remove rows to toggle their visiblity in the show action
  show do |clinic|
    attributes_table do
      row :id
      row :clinic_date
      # row :venue
      row :address
      row :lead_vaccinator_name
      row :students_registered
      row :clinic_status
      row :users
      row :outcome_comments
      row :incidents_comments
      row :start_time
      row :end_time
      row :duration
      row :services
      row :age_groups
      row :created_at
      row :updated_at
    end
    panel "Location", class:'aa-text-align-center' do
      render partial: 'admin/clinics/admin_map'
    end
    active_admin_comments
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.inputs do
      f.input :clinic_date
      f.input :address
      # f.input :venue
      f.input :lead_vaccinator_name
      f.input :students_registered
      f.input :clinic_status
      f.input :outcome_comments
      f.input :incidents_comments
      f.input :start_time
      f.input :end_time
      f.input :duration
      f.inputs "Services Offered" do
        f.input :services, as: :check_boxes
      end
      f.inputs "Age Groups Served" do
        f.input :age_groups, as: :check_boxes
      end
    end
    f.actions
  end
  
end
