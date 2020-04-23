ActiveAdmin.register Patient do

  permit_params :clinic_id, :clinic_event_id, :student_id, :vaccination_status, :clinic_vaccine_id, :user_id, :clinic_staff_id, :reaction_type, :downloaded_status, :state, :county, :city, :zip_code, :first_name, :last_name, :mothers_maiden_name, :address, :email, :email_confirmation, :date_of_birth, :sex, :phone_number, :insured_first_name, :insured_last_name, :insured_date_of_birth, :relation_to_patient_for_insurance, :insurance_type, :member_id_for_insurance, :card_number_for_insurance, :insurance_company_name, :group_number_for_insurance, :has_fever_over, :has_cough, :has_difficult_breathing, :had_contact_with_confirmed_case, :has_other_reason, :other_reason_explanation, :is_age_60_or_more, :had_traveled_to_affected_place, :has_risk_factor, :consent_signature, :relation_to_patient_for_consent, :consent_date, :school, :access_code, :venue_id, :venue
  
  # filter :venues, as: :select, collection: proc { Venue.all.collect{|v| v.name}.uniq}
  filter :clinics, as: :select, collection: Clinic.all
  filter :city
  filter :county
  filter :state
  filter :zip_code
  filter :first_name
  filter :last_name
  filter :address
  filter :email
  filter :phone_number

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :sex
    column :state
    column :county
    actions
  end

  show do |patient|
    attributes_table title: "Patient Personal Details" do
      row :id
      row :first_name
      row :last_name
      row :mothers_maiden_name
      row :date_of_birth
      row :sex
      row :phone_number
      row :email
      row :address
      row :city
      row :state
      row :zip_code
      row :county
      row :created_at
      row :updated_at
    end

    attributes_table title: "Patient Clinic Record" do
      row :vaccination_status
      row :clinic_staff
      row :reaction_type
    end

    attributes_table title: "Health Insurance" do
      row :insured_first_name
      row :insured_last_name
      row :insured_date_of_birth
      row :relation_to_patient_for_insurance
      row :insurance_type
      row :member_id_for_insurance
      row :card_number_for_insurance
      row :insurance_company_name
      row :group_number_for_insurance
    end
    
    attributes_table title: "Intake Questionnaire Responses" do
      row :has_fever_over
      row :has_cough
      row :has_difficult_breathing
      row :had_contact_with_confirmed_case
      row :has_other_reason
      row :other_reason_explanation
      row :is_age_60_or_more
      row :had_traveled_to_affected_place
      row :has_risk_factor
    end

    attributes_table title: "Consent Form Status" do
      row :access_code
      row :consent_signature
      row :relation_to_patient_for_consent
      row :consent_date
    end 
  end
  
  form do |f|
    tabs do
      tab "Patient Personal Details" do
        f.inputs do
          input :id
          input :first_name
          input :last_name
          input :mothers_maiden_name
          input :date_of_birth, label: "Date of Birth"
          input :sex
          input :phone_number
          input :email
          input :address
          input :city
          input :state
          input :zip_code
          input :county
        end
      end
  
      tab "Patient Clinic Record" do
        f.inputs do
          input :clinic_events
          input :vaccination_status
          input :reaction_type
        end
      end
  
      tab "Health Insurance" do
        f.inputs do
          # input :insured_first_name
          # input :insured_last_name
          input :insured_date_of_birth
          input :relation_to_patient_for_insurance
          input :insurance_type
          input :member_id_for_insurance
          input :card_number_for_insurance
          input :insurance_company_name
          input :group_number_for_insurance
        end
      end
      
      tab "Intake Questionnaire Responses" do
        f.inputs do
          input :has_fever_over
          input :has_cough
          input :has_difficult_breathing
          input :had_contact_with_confirmed_case
          input :has_other_reason
          input :other_reason_explanation
          input :is_age_60_or_more
          input :had_traveled_to_affected_place
          input :has_risk_factor
        end
      end
  
      tab "Consent Form Status" do
        f.inputs do
          input :access_code
          input :consent_signature
          input :relation_to_patient_for_consent
          input :consent_date
        end
      end
    end

    f.actions
  end
end
