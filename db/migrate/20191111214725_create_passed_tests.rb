class CreatePassedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :passed_tests do |t|

      t.timestamps
    end
  end
end
