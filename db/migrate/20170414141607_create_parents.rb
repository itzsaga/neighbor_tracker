class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.string :name
      t.integer :house_id
    end
  end
end
