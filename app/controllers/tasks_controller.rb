class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :body))
    if @task.save
      flash[:notice] = "Your task has been added to your list."
      redirect_to @task
    else
      flash[:error] = "There was an error adding this task to your list. Please try again."
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params.require(:task).permit(:title, :body))
      flash[:notice] = "Your task has been updated."
      redirect_to @task
    else
      flash[:error] = "There was an error saving your task. Please try again."
      render :edit
    end
  end
end
