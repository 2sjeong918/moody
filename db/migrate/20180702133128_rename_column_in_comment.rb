class RenameColumnInComment < ActiveRecord::Migration
  def change
    rename_column :comments, :postid, :post_id
    rename_column :comments, :userid, :user_id
  end
end
