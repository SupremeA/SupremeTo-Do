class CompletesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    @task = current_user.tasks.build(task_params)
    @task = @task.completed :true

    if @task.save
      flash[:notice] = "Your task has been completed."
      redirect_to [@list, @task]
    else
      flash[:error] = "Please try again."
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    complete = current_user.self.task.update_attributes(:completed => false)

    if completed.false
      flash[:notice] = "You have marked this task as incomplete."
      redirect_to [@task.list, @task]
    else
      flash[:error] = "Please try to complete again."
      redirect_to [@task.list, @task]
    end
  end
end
