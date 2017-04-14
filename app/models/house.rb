class House < ActiveRecord::Base
  belongs_to :user
  has_many :parents
  has_many :children, through: :parents
end
