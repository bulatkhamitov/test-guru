class CreatePassedtests < ActiveRecord::Migration[6.0]
  def change
    create_table :passedtests do |t|

      t.timestamps
    end

    add_reference :passedtests, :users, foreign_key: true
    add_reference :passedtests, :tests, foreign_key: true
  end
end
