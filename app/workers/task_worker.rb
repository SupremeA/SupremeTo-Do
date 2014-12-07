class TaskWorker
  include Sidekiq::Worker

#  def perform(rake, 5)
#      rake delete_tasks
#  end
end
