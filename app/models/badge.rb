class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :icon_url, presence: true
  validates :rule, presence: true, allow_blank: true
end
