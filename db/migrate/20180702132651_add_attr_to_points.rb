class AddAttrToPoints < ActiveRecord::Migration
  def change
    add_column :points, :content, :text
    add_column :points, :cardimg, :string
  end
end
