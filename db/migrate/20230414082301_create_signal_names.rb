class CreateSignalNames < ActiveRecord::Migration[7.0]
  def change
    create_table :signal_names do |t|
      t.string :name
    end
  end
end
