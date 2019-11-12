class Test < ApplicationRecord
  def self.sort_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id').where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
