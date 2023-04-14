class CreateSignalValues < ActiveRecord::Migration[7.0]
  def change
    create_table :signal_values do |t|
      t.float :value

      t.timestamps
    end
  end
end
