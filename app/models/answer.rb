class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_number_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_number_of_answers
    errors.add(:question) if question.answers.count >= 4
  end
end
