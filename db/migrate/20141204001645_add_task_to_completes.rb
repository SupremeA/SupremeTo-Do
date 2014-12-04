class AddTaskToCompletes < ActiveRecord::Migration
  def change
    add_index :completes, :task_id
  end
end
