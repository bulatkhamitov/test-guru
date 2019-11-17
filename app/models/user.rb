class User < ApplicationRecord
  has_many :passed_tests, dependent: :destroy
  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy

  validates :email, presence: true

  def passed_by_level(level)
    tests.where(level: level)
  end
end
