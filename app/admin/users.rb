ActiveAdmin.register User do

  permit_params do
    permitted = [:email, :password, :password_confirmation, :name, :role, {clinic_ids: []}]
    if params[:user] && params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    permitted
  end
  
  filter :email
  filter :name
  filter :role, as: :select, collection: USER_ROLES
  
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :role
    column :sign_in_count
    column :current_sign_in_at
    column :created_at
    column :updated_at
    actions
  end

  show do |user|
    attributes_table do
      row :id
      row :email
      row :name
      row :role
      row :created_at
      row :updated_at
      row :clinics
    end

    attributes_table title: "Login Records" do
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip        
      row :failed_attempts
    end
  
    attributes_table title: "Security Details" do
      row :unconfirmed_email
      row :reset_password_sent_at
      row :remember_created_at
      row :confirmed_at
      row :confirmation_sent_at
      row :locked_at
    end
    active_admin_comments
  end

  form do |f|
    tabs do
      tab "User Account" do
        f.inputs do
          f.inputs "User Details" do
            f.input :email
            f.input :name
            f.input :role, as: :select, collection: USER_ROLES
          end
          f.inputs "Change Password (leave blank to leave password unchanged)" do
            f.input :password
            f.input :password_confirmation
          end
        end        
      end
      tab "Clinic Access" do
        f.input :clinics, as: :check_boxes
      end
    end
    
    f.actions
  end
  
end
