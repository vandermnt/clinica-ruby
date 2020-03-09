class Query < ApplicationRecord
  belongs_to :patient
  belongs_to :specialist
end
