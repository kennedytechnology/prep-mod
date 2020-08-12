ActiveAdmin.register User do

  permit_params do
    permitted = [:email, :email_confirmation, :password, :password_confirmation, :first_name, :last_name, :role, {clinic_ids: []}]
    if params[:user] && params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    permitted
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :role, as: :select, collection: USER_ROLES

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
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
      row :first_name
      row :last_name
      row :role
      row :name
      row :titleized_role, label: 'Role'
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
            f.input :email_confirmation
            f.input :first_name
            f.input :last_name
            f.input :role, as: :select, collection: User.valid_roles.map { |r| [r.to_s.titleize, r.to_s]}
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
