class User < ApplicationRecord
  belongs_to :child, optional: true

  has_many :custodies
  # has_many :unread_messages, -> { where(read: false) },
  #          class_name: 'Message',
  #          foreign_key: :receiver_id

  has_one :ex_partner, class_name: 'User', foreign_key: :child_id, primary_key: :child_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
