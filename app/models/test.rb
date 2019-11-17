class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1).order(level: :desc) }
  scope :medium, -> { where(level: 2..4).order(level: :desc) }
  scope :hard, -> { where(level: 5..Float::INFINITY).order(level: :desc) }

  scope :with_level, -> (level) { where(level: level) }
  scope :sort_by_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title) }
end
