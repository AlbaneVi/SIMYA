class Custody < ApplicationRecord
  belongs_to :user

  has_many :media, dependent: :destroy

  validates :day_on, presence: true
end
