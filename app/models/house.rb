class House < ActiveRecord::Base
  has_many :parents
  has_many :children, through: :parents

  validates :address, presence: true
end
