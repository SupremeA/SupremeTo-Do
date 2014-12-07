class TasksController < ApplicationController

  before_filter :authenticate_user!


  def index
    @tasks = Task.all
  end

  def show
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = current_user.tasks.build(task_params)
    @task.list = @list

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
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])

    if @task.update_attributes(params.require(:task).permit(:title, :body))
      flash[:notice] = "Your task has been updated."
      redirect_to [@list]
    else
      flash[:error] = "There was an error saving your task. Please try again."
      render :new
    end
  end

  def completed_true(task)
    @task = Task.find(params[:id])
    @task.update_attributes(:completed => true)
      if self.completed? == true
        redirect_to (@task)
      else
        redirect_to @list
      end
  end

  def completed_false(task)
    @task = Task.find(params[:id])
    @task.update_attributes(:completed => false)
      if self.completed? == false
        redirect_to (@task)
      else
        redirect_to @list
      end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
