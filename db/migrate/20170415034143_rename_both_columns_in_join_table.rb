class RenameBothColumnsInJoinTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :parent_children, :parents_id, :parent_id
    rename_column :parent_children, :children_id, :child_id
  end
end
