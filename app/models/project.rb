class Project < ApplicationRecord
  with_options presence: true do
    validates :title,
      length: {maximum: 40},
      presence: true
    validates :text, presence: true
    validates :profile, presence: true
    validates :target_amount, presence: true
    validates :tarm, presence: true
    validates :return_title_1, presence: true
    validates :return_price_1, 
    numericality: {only_integer: true, greater_than_or_equal_to: 500, less_than_or_equal_to: 100000},
    presence: true
  end

  belongs_to :user
  has_one :draft
  mount_uploader :image, ImageUploader
  mount_uploader :profile_image, ImageUploader
  mount_uploader :return_image_1, ImageUploader
  mount_uploader :return_image_2, ImageUploader
  mount_uploader :return_image_3, ImageUploader

end
