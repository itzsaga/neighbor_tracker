class Child < ActiveRecord::Base
  # belongs_to :house
  has_many :parent_children
  has_many :parents, through: :parent_children
end
