class Project < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :profile
    validates :target_amount
    validates :tarm
    validates :return_title_1
    validates :return_price_1
  end

  belongs_to :user
end
