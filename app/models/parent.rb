class Parent < ActiveRecord::Base
  belongs_to :house
  has_many :parent_children
  has_many :children, through: :parent_children

  validates :name, presence: true
end
