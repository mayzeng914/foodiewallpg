class AddImageToFoodiepictures < ActiveRecord::Migration
  def change
  	add_attachment :foodiepictures, :image
  end
end
