class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :postid
      t.integer :userid
      t.text :content

      t.timestamps null: false
    end
  end
end
