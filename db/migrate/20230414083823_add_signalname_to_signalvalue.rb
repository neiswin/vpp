class AddSignalnameToSignalvalue < ActiveRecord::Migration[7.0]
  def change
    add_reference :signal_values, :signal_name, foreign_key: true
  end
end
