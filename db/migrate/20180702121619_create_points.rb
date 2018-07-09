class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.float :latitude
      t.float :longitude
      t.string :point_title
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
