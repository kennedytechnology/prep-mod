class AddGradeAndHomeroomTecherToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :grade, :string
    add_column :patients, :homeroom_teacher, :string
  end
end
