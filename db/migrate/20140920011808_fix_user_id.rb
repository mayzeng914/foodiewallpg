class FixUserId < ActiveRecord::Migration
  def change
  	rename_column :comments, :users_id, :user_id
  end
end
