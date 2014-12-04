class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.integer :user_id

      t.timestamps
    end
  end
end
