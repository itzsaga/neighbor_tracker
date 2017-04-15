class RenameParentIdInParentChildren < ActiveRecord::Migration[5.0]
  def change
    rename_column :parent_children, :parent_id, :parents_id
  end
end
