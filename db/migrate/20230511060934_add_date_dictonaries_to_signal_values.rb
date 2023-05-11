class AddDateDictonariesToSignalValues < ActiveRecord::Migration[7.0]
  def change
    add_reference :signal_values, :date_dictonaries, foreign_key: true
  end
end
