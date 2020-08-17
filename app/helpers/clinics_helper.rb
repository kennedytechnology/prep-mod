module ClinicsHelper
  def link_to_add_row(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("clinics/" + association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_test_kit(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("clinics/" + association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "add_test_kit_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_clinic_date(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("clinics/" + association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "button-action mb-2 add-clinic-date " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_new_vaccine(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("clinics/activity/" + association.to_s.singularize, f: builder)
    end
    link_to(name, 'javascript:', class: "button-action mb-2 button-add-new-vaccine " + args[:class], data: {id: id, fields: fields.gsub("\n", ""), action: "click->main#addVaccineDetails"})
  end
end
