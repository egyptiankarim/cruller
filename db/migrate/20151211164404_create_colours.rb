class CreateColours < ActiveRecord::Migration
  def change
    create_table :colours do |t|
      t.string :hex_code, limit: 6

      t.timestamps null: false
    end
    add_index :colours, :hex_code, unique: true
  end
end
