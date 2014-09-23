class AddImageFingerprintToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :image_fingerprint, :string
  end
end
