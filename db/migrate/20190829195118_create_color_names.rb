class CreateColorNames < ActiveRecord::Migration[6.0]
  def change
    create_table :color_names do |t|
      t.text :color_name

      t.timestamps
    end
  end
end
