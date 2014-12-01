class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :public, default: true
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
