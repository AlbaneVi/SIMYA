class Custody < ApplicationRecord
  belongs_to :user

  has_many :media, dependent: :destroy

  validates :day_on, presence: true

  def future?
    day_on > Date.today
  end

  def poor?
    media.blank? && title.blank? && text.blank?
  end
end
