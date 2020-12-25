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
  mount_uploader :image, ImageUploader
end
