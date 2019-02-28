class Medium < ApplicationRecord
  belongs_to :custody
  mount_uploader :photo, PhotoUploader
end
