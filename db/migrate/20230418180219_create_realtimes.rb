class CreateRealtimes < ActiveRecord::Migration[7.0]
  def change
    create_table :realtimes do |t|
      t.string :name
      t.string :value
      t.belongs_to :signal_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end
