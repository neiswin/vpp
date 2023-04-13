class CreateOpcuaPools < ActiveRecord::Migration[7.0]
  def change
    create_table :opcua_pools do |t|
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
