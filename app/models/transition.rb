class Transition < ApplicationRecord
  has_many :residencies
  has_many :users, through: :residencies
end
