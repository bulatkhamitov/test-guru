class RenameValueAttributeToRuleValue < ActiveRecord::Migration[6.0]
  def change
    rename_column :badges, :value, :rule_value
  end
end
