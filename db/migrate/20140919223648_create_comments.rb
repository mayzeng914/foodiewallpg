class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :users, index: true
      t.references :foodiepictures, index: true

      t.timestamps
    end
  end
end
