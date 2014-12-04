class AddUserToCompletes < ActiveRecord::Migration
  def change
    add_index :completes, :user_id
  end
end
