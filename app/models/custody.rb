class Custody < ApplicationRecord
  belongs_to :user

  has_many :media, dependent: :destroy
  accepts_nested_attributes_for :media

  validates :day_on, presence: true

  def future?
    day_on > Date.today
  end

  def poor?
    media.blank? && title.blank? && text.blank?
  end

  def switch
    self.user = user.child.parents.where.not(id: user.id).first
    self.change_at = Time.now
    save
  end
end
