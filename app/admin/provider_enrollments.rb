ActiveAdmin.register ProviderEnrollment do

  permit_params :first_name, :last_name, :middle_initial, 
    :practice_fax_number, :npi_number, :license_number, 
    :license_type, :medical_specialty, :professional_license, 
    :license_state_of_issue, :license_date_of_issue, :title, 
    :practice_name, :practice_address, :practice_city, 
    :practice_state, :practice_zip_code, :practice_office_phone, 
    :practice_mobile_phone, :practice_email, :practice_backup_contact, 
    :practice_backup_office_phone, :practice_backup_email, :freezer, 
    :does_provide_vaccination, :does_provide_vfc, :refrigerator, 
    :refrigerator_thermometer, :additional_info, :practice_type, 
    :contact_office_phone, :contact_mobile_phone, :contact_email, 
    :practice_backup_mobile_phone, :status, :county

  filter :first_name
  filter :last_name
  filter :medical_specialty
  filter :professional_license
  filter :practice_type
  filter :practice_state
  filter :county
  filter :practice_city
  filter :does_provide_vaccination
  filter :does_provide_vfc
 
  index do
    selectable_column
    id_column
    column :medical_specialty
    column :professional_license
    column :practice_type
    column :practice_state
    column :county
    column :practice_city
    column :does_provide_vaccination
    column :does_provide_vfc
    actions
  end
 
  show do |patient|
    attributes_table title: "Provider Personal Details" do
      row :id
      row :first_name
      row :last_name
      row :middle_initial
    end

    attributes_table title: "Vaccination Details" do
      row :status
      row :does_provide_vaccination
      row :does_provide_vfc
    end

    attributes_table title: "Professional Details" do     
      row :title
      row :medical_specialty
      row :professional_license
      row :npi_number
      row :license_number
      row :license_type
      row :license_state_of_issue
      row :license_date_of_issue
    end

    attributes_table title: "Practice Details" do
      row :practice_type        
      row :practice_address
      row :practice_city
      row :county
      row :practice_state
      row :practice_zip_code
      row :practice_office_phone
      row :practice_fax_number
      row :practice_mobile_phone
      row :practice_email
      row :practice_backup_contact
      row :practice_backup_office_phone
      row :practice_backup_mobile_phone
      row :practice_backup_email
      row :refrigerator
      row :refrigerator_thermometer
      row :freezer
      row :contact_office_phone
      row :contact_mobile_phone
      row :contact_email
    end
    
    attributes_table title: "Additional Details" do
      row :additional_info
    end
  end

  form do |f|

    tabs do
      tab "Patient Personal Details" do
        f.inputs do
        #  input :id
          input :first_name
          input :last_name
          input :middle_initial
        end
      end
  
      tab "Vaccination Details" do
        f.inputs do
          input :status
          input :does_provide_vaccination
          input :does_provide_vfc
        end
      end

      tab "Professional Details" do
        f.inputs do
          input :title
          input :medical_specialty, as: :select, collection: MEDICAL_SPECIALTY
          input :professional_license, as: :select, collection: PROFESSIONAL_LICENSES
          input :npi_number
          input :license_number
          input :license_type
          input :license_state_of_issue, as: :select, collection: US_STATES
          input :license_date_of_issue, as: :datetime_picker
        end
      end

      tab "Practice Details" do
        f.inputs do
          input :practice_type, as: :select, collection: PRACTICE_TYPES
          input :practice_address
          input :practice_city
          input :county, as: :select, collection: COUNTIES
          input :practice_state, as: :select, collection: US_STATES
          input :practice_zip_code
          input :practice_office_phone
          input :practice_fax_number
          input :practice_mobile_phone
          input :practice_email
          input :practice_backup_contact
          input :practice_backup_office_phone
          input :practice_backup_mobile_phone
          input :practice_backup_email
          input :refrigerator
          input :refrigerator_thermometer
          input :freezer
          input :contact_office_phone
          input :contact_mobile_phone
          input :contact_email
        end
      end
   
      tab "Additional Details" do
        f.inputs do
          input :additional_info
        end
      end

    end

    f.actions
  end
  
end
