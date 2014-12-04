class CreateCompletes < ActiveRecord::Migration
  def change
    create_table :completes do |t|
      t.string :user
      t.string :task

      t.timestamps
    end
  end
end
