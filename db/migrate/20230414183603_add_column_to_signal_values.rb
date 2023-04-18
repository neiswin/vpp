class AddColumnToSignalValues < ActiveRecord::Migration[7.0]
  def change
    add_column :signal_values, :type_value, :string
  end
end
