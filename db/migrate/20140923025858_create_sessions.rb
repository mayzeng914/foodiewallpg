class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :users, index: true

      t.timestamps
    end
  end
end
