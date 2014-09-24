class FixCommentId < ActiveRecord::Migration
  def change
  	rename_column :foodiepictures, :comments_id, :comment_id
  	rename_column :users, :comments_id, :comment_id
  end
end
