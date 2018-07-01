class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :userid
      t.string :title
      t.string :postimg
      t.string :mood1
      t.string :mood2
      t.string :mood3
      t.string :mood4
      t.string :mood5
      t.string :mood6
      t.string :mood7
      t.string :mood8
      t.string :mood9
      t.string :mood10
      t.string :mood11
      t.string :mood12



      t.timestamps null: false
    end
  end
end
