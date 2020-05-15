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

  #  filter :clinics, as: :select, collection: Clinic.all
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
     attributes_table title: "Patient Personal Details" do
        row :id
        row :first_name
        row :last_name
        row :middle_initial
        row :does_provide_vaccination
        row :does_provide_vfc
        row :status
        row :title
        row :medical_specialty
        row :professional_license
        row :npi_number
        row :license_number
        row :license_type
        row :license_state_of_issue
        row :license_date_of_issue
        #  row :practice_type        
        row :county
        row :practice_address
        row :practice_city
        row :practice_state
        row :practice_zip_code
        row :practice_fax_number
        row :practice_office_phone
        row :practice_mobile_phone
        row :practice_email
        row :practice_backup_contact
        row :practice_backup_office_phone
        row :practice_backup_mobile_phone
        row :practice_backup_email
        row :freezer
        row :refrigerator
        row :refrigerator_thermometer
        row :additional_info
        row :contact_office_phone
        row :contact_mobile_phone
        row :contact_email
     end
 
  #    attributes_table title: "Patient Clinic Record" do
  #      row "Clinic events" do
  #        patient.clinic_events.collect{|ce| ce.category }
  #      end 
  #      row :vaccination_status
  #      row :clinic_staff
  #      row :reaction_type
  #    end
     
  #    # clinic_events attributes:

 
  #    attributes_table title: "Health Insurance" do
  #      row :insured_first_name
  #      row :insured_last_name
  #      row :insured_date_of_birth
  #      row :relation_to_patient_for_insurance
  #      row :insurance_type
  #      row :member_id_for_insurance
  #      row :card_number_for_insurance
  #      row :insurance_company_name
  #      row :group_number_for_insurance
  #    end
     
  #    attributes_table title: "Intake Questionnaire Responses" do
  #      row :has_fever_over
  #      row :has_cough
  #      row :has_difficult_breathing
  #      row :had_contact_with_confirmed_case
  #      row :is_age_60_or_more
  #      row :had_traveled_to_affected_place
  #      row :has_risk_factor
  #      row :has_other_reason
  #      row :other_reason_explanation
  #    end
 
  #    attributes_table title: "Consent Form Status" do
  #      row :access_code
  #      row :signatory_first_name
  #      row :signatory_last_name
  #      row :consent_signature
  #      row :relation_to_patient_for_consent
  #      row :consent_date
  #    end 
  #  end
   
  #  form do |f|
  #    tabs do
  #      tab "Patient Personal Details" do
  #        f.inputs do
  #          input :id
  #          input :first_name
  #          input :last_name
  #          input :mothers_maiden_name
  #          input :date_of_birth, label: "Date of Birth", as: :datetime_picker
  #          input :sex
  #          input :phone_number
  #          input :email
  #          input :address
  #          input :city
  #          input :state
  #          input :zip_code
  #          input :county
  #        end
  #      end
   
  #      tab "Patient Clinic Record" do
  #        f.inputs do
  #          input :clinic_events, as: :select, collection: ClinicEvent.where(patient_id: patient.id).collect{|ce| ce.category}
  #          input :vaccination_status
  #          input :reaction_type
  #        end
  #      end
   
  #      tab "Health Insurance" do
  #        f.inputs do
  #          input :insured_first_name
  #          input :insured_last_name
  #          input :insured_date_of_birth, as: :datetime_picker
  #          input :relation_to_patient_for_insurance
  #          input :insurance_type
  #          input :member_id_for_insurance
  #          input :card_number_for_insurance
  #          input :insurance_company_name
  #          input :group_number_for_insurance
  #        end
  #      end
       
  #      tab "Intake Questionnaire Responses" do
  #        f.inputs do
  #          input :has_fever_over
  #          input :has_cough
  #          input :has_difficult_breathing
  #          input :had_contact_with_confirmed_case
  #          input :has_other_reason
  #          input :other_reason_explanation
  #          input :is_age_60_or_more
  #          input :had_traveled_to_affected_place
  #          input :has_risk_factor
  #        end
  #      end
   
  #      tab "Consent Form Status" do
  #        f.inputs do
  #          input :access_code
  #          input :signatory_first_name
  #          input :signatory_last_name
  #          input :consent_signature
  #          input :relation_to_patient_for_consent
  #          input :consent_date, as: :datetime_picker
  #        end
  #      end
  #    end
 
     f.actions
   end
  
end
