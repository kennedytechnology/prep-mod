ActiveAdmin.register Message do
  permit_params :status, :subject, :body, :send_to_all_users

  index do
    selectable_column
    id_column
    column :subject
    column :body
    column :status
    column "Message for:" do |message|
      "All Users" if message.send_to_all_users
    end
    actions
  end

  form do |f|
    f.inputs do 
      f.input :subject
      f.input :body
      f.input :send_to_all_users, as: :boolean
      unless f.object.status == "approve" || f.object.status == "reject"
        f.input :status, label: "Should Send Message?", as: :select, collection: ["approve", "reject"]
      end
    end
    f.actions
  end
end
