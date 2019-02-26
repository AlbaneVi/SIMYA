class Residency < ApplicationRecord
  belongs_to :user
  belongs_to :transition
end
