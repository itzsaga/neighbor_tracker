class Child < ActiveRecord::Base
  has_many :parent_children
  has_many :parents, through: :parent_children

  validates :name, presence: true
end
