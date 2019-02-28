class Child < ApplicationRecord
  has_many :parents, class_name: 'User'
end
