class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_find_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def passed?
    success_rate >= 85
  end

  def success_rate
    correct_questions / total_questions * 100
  end

  def total_questions
    test.questions.count
  end

  def current_question_index
    test.questions.where('id < ?', current_question.id).count + 1
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  private

  def before_validation_find_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) && correct_answers_count  == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
