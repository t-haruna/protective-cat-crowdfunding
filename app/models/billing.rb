class Billing < ApplicationRecord
  validates :count_1_or_count_2_or_count_3, presence: true

  belongs_to :user
  belongs_to :project

  private
    def count_1_or_count_2_or_count_3
      count_1.presence or count_2.presence or count_3.presence
    end
end
