class AddQuestionsTextNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :text, false)
  end
end
