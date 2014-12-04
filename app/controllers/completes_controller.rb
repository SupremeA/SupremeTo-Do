class CompletesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @task = Task.find(params[:task_id])
    complete = current_user.completes.build(task_id: @task_id)

    if complete.save
      flash[:notice] = "Congrats on completing your task!"
      redirect_to [@task.list, @task]
    else
      flash[:error] = "Are you sure you completed this? Please try to complete again."
      redirect_to [task.list, task]
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    complete = current_user.completes.destroy(task_id: @task_id)

    if complete.destroy
      flash[:notice] = "You have marked this task as incomplete."
      redirect_to [@task.list, @task]
    else
      flash[:error] = "Please try to complete again."
      redirect_to [@task.list, @task]
    end
  end
end
