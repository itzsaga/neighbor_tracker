class RenameJoinTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :parents_children, :parent_children
  end
end
