class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.references :foodiepictures, index: true
      t.references :comments, index: true
      t.boolean :is_active

      t.timestamps
    end
  end
end
