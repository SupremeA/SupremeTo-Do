class TasksController < ApplicationController
  def index
    @tasks = Task.all
    authorize @tasks
  end

  def show
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
    authorize @task
  end

  def create
    @list = List.find(params[:list_id])
    @task = current_user.tasks.build(post_params)
    @task.list = @list
    authorize @task

    if @task.save
      flash[:notice] = "Your task has been added to your list."
      redirect_to [@list, @task]
    else
      flash[:error] = "There was an error adding this task to your list. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    authorize @task

    if @task.update_attributes(params.require(:task).permit(:title, :body))
      flash[:notice] = "Your task has been updated."
      redirect_to [@list, @task]
    else
      flash[:error] = "There was an error saving your task. Please try again."
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
end
