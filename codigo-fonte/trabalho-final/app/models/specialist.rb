class Specialist < ApplicationRecord
  belongs_to :specialty
  has_many :query
end
