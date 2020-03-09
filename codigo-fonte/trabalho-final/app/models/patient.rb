class Patient < ApplicationRecord
  has_many :exam
  has_many :query
end
