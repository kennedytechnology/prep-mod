class AddCommentToEmployers < ActiveRecord::Migration[6.0]
  def change
    add_column :employers, :comment, :text
  end
end
