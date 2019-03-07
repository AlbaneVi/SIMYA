class User < ApplicationRecord
  belongs_to :child, optional: true

  has_many :custodies
  # has_many :unread_messages, -> { where(read: false) },
  #          class_name: 'Message',
  #          foreign_key: :receiver_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def ex_partner
    User.where(child_id: child_id).where.not(id: id).first
  end

  def class_css
    if first_partner?
      'bg-user-1'
    else
      'bg-user-2'
    end
  end

  def first_partner?
    return true unless ex_partner

    self.created_at < ex_partner.created_at
  end

  def fixed_ex_partner
    child.parents.where.not(id: id).last
  end
end
