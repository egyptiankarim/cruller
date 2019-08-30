class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :color_id
      t.integer :name_id
      t.integer :vote_count

      t.timestamps
    end
  end
end
