class Parent < ActiveRecord::Base
  belongs_to :house
  has_many :parents_child
  has_many :children, through: :parents_child
end
