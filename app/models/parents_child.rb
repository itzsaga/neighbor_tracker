class ParentsChild < ActiveRecord::Base
  belongs_to :parent
  belongs_to :child
end
