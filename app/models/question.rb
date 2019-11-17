class Question < ApplicationRecord
  belongs_to :test

  validates :text, presence: true

  has_many :answers, dependent: :destroy
end
