class Residency < ApplicationRecord
  belongs_to :parents
  belongs_to :transitions
end
