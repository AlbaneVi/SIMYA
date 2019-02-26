class Residency < ApplicationRecord
  belongs_to :users
  belongs_to :transitions
end
