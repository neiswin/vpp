class CreateDateDictonaries < ActiveRecord::Migration[7.0]
  def change
    create_table :date_dictonaries do |t|
      t.integer :year
      t.integer :month
      t.integer :week
      t.integer :day
      t.integer :hour

      t.timestamps
    end
  end
end
