class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_number_of_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_answers
    errors.add(:question) unless self.class.where(question: question).count.between?(1, 4)
  end
end
