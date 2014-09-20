class FixFoodiepictureId < ActiveRecord::Migration
  def change
  	rename_column :comments, :foodiepictures_id, :foodiepicture_id
  end
end
