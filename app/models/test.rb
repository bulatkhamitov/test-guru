class Test < ApplicationRecord
  class << self
    def sort_by_category(category)
      joins('JOIN categories ON tests.categories_id = categories_id').where(categories: { title: category }).order(title: :desc).pluck(:title)
    end
  end
end
