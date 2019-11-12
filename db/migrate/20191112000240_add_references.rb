class AddReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, foreign_key: true
    add_reference :tests, :category, foreign_key: true

    add_reference :questions, :test, foreign_key: true

    add_reference :answers, :question, foreign_key: true

    add_reference :passed_tests, :user, foreign_key: true
    add_reference :passed_tests, :test, foreign_key: true
  end
end
