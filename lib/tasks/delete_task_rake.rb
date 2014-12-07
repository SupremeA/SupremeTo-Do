desc "Delete task after 7 days"
task delete_tasks: :environment do
  Task.where("created_at <= ?", Time.now - 7.days).destroy_all
end
