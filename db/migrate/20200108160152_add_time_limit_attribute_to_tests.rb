class AddTimeLimitAttributeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time_limit, :integer
  end
end
