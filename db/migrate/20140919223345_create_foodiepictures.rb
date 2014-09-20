class CreateFoodiepictures < ActiveRecord::Migration
  def change
    create_table :foodiepictures do |t|
      t.string :description
      t.references :user, index: true
      t.references :comments, index: true

      t.timestamps
    end
  end
end
