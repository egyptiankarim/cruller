class CreateColours < ActiveRecord::Migration[5.2]
  def change
    create_table :colours do |t|
      t.string :hex_code
      t.string :name
      t.integer :hits

      t.timestamps
    end
  end
end
