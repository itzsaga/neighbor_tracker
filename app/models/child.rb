class Child < ActiveRecord::Base
  belongs_to :house, through: :parent
  has_many :parents_child
  has_many :parents, through: :parents_child
end
