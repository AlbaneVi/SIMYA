class Message < ApplicationRecord
  belongs_to :receiver, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  before_validation :set_current_time

  validates :body, presence: true
  validates :send_at, presence: true

  scope :between, lambda { |sender, receiver|
    where("(sender_id = ? AND receiver_id = ?
          OR (receiver_id = ? AND sender_id = ?)",
          sender.id, receiver.id, sender.id, receiver.id)
  }

  private

  def set_current_time
    self.send_at = Time.now
  end
end

