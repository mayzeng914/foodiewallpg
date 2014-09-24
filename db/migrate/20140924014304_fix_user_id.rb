class FixUserId < ActiveRecord::Migration
  def change
  	rename_column :sessions, :users_id, :user_id
  end
end