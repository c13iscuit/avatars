class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
