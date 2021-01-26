class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128

  validates :nickname, presence: true, uniqueness: true
  #空の文字列は保存不可

  has_many :projects
  has_many :drafts
  has_many :billings
  has_many :executes
  has_one :card, dependent: :destroy
end
