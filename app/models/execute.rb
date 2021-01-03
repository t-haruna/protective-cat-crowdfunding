class Execute < ApplicationRecord
  validates :execute_title,
    length: {maximum: 40},
    presence: true
  validates :execute_image, presence: true
  validates :execute_text, presence: true
  

  belongs_to :user
  belongs_to :project

  mount_uploader :execute_image, ImageUploader
end
