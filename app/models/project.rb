class Project < ApplicationRecord

  validates :title,
    length: {maximum: 40},
    presence: true
  validates :text, presence: true
  validates :profile, 
    length: {maximum: 1000},
    presence: true
  validates :profile_image, presence: true
  validates :target_amount,
  numericality: {only_integer: true, greater_than_or_equal_to: 10000, less_than_or_equal_to: 5000000},
  presence: true
  validates :tarm, presence: true
  validates :return_title_1,
    length: {maximum: 100},
    presence: true
  validates :return_price_1, 
  numericality: {only_integer: true, greater_than_or_equal_to: 500, less_than_or_equal_to: 100000},
  presence: true
  validates :return_title_2,
    length: {maximum: 100},
    presence: true
  validates :return_price_2, 
  numericality: {only_integer: true, greater_than_or_equal_to: 500, less_than_or_equal_to: 100000},
  presence: true
  validates :return_title_3,
    length: {maximum: 100},
    presence: true
  validates :return_price_3, 
  numericality: {only_integer: true, greater_than_or_equal_to: 500, less_than_or_equal_to: 100000},
  presence: true
  validate :finish_tarm_setting
  validate :first_tarm_setting
  # validatesではなくvalidateなので注意
  belongs_to :user
  has_one :draft
  has_many :billings
  mount_uploader :image, ImageUploader
  mount_uploader :profile_image, ImageUploader
  mount_uploader :return_image_1, ImageUploader
  mount_uploader :return_image_2, ImageUploader
  mount_uploader :return_image_3, ImageUploader

  def finish_tarm_setting
    errors.add(:tarm, "は最大180日間です") if tarm > Date.today + 180
  end

  def first_tarm_setting
    errors.add(:tarm, "を本日以降に設定してください") if Date.today >= tarm
  end

  



end
