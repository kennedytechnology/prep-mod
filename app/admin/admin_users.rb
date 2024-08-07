ActiveAdmin.register AdminUser do
  menu parent: "Admin", priority: 1
  permit_params do
    permitted = [:email, :password, :password_confirmation]
    if params[:admin_user] && params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank?
      params[:admin_user].delete(:password)
      params[:admin_user].delete(:password_confirmation)
    end
    permitted
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
