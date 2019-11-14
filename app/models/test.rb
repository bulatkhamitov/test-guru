class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  def self.sort_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
