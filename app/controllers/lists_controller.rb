class ListsController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
      @tasks = @list.tasks
    authorize @list
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params.require(:list).permit(:name, :description, :public))
    if @list.save
      flash[:notice] = "Your List has been created."
      redirect_to @list
    else
      flash[:error] = "Error creating your To-Do list. Please try again."
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params.require(:list).permit(:title, :description))
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "Error saving your To-Do list. Please try again"
      render :edit
    end
  end
end
