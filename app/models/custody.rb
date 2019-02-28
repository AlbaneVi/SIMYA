class Custody < ApplicationRecord
  belongs_to :user

  has_many :media

  validates :day_on, presence: true
end
