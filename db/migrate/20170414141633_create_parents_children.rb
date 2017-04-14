class CreateParentsChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :parents_children do |t|
      t.integer :parent_id
      t.integer :children_id
    end
  end
end
