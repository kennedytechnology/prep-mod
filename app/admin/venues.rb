ActiveAdmin.register Venue do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :named_place_id, :name, :venue_category, :address, :latitude, :longitude
  #
  # or
  #
  # permit_params do
  #   permitted = [:named_place_id, :name, :venue_category, :address, :latitude, :longitude]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  # Limit actions available to your users by adding them to the 'except' array
  # actions :all, except: []

  # Add or remove filters (you can use any ActiveRecord scope) to toggle their
  # visibility in the sidebar
  # filter :id
  # filter :named_place
  # filter :name
  # filter :venue_category
  # filter :created_at
  # filter :updated_at
  # filter :address
  # filter :latitude
  # filter :longitude

  # Add or remove columns to toggle their visiblity in the index action
  index do
    selectable_column
    id_column
    column :name
    column :venue_category
    column :named_place
    actions
  end

  # Add or remove rows to toggle their visiblity in the show action
  show do |venue|
    attributes_table do
      row :id
      row :named_place
      row :name
      row :venue_category
      row :clinics
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end


  form do |f|
    f.inputs do
      f.input :named_place
      f.input :name
      f.input :venue_category, as: :select, collection: VENUE_CATEGORIES
    end
    f.actions
  end
  
end
