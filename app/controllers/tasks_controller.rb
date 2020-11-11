class TasksController < ApplicationController
  def list
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(restaurant_params)
    @tasks.save

    # no need for app/views/restaurants/create.html.erb
    # redirect_to restaurant_path(@restaurant)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(tasks_params)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy!
    # redirect_to task_path(@tasks)
    # no need for app/views/restaurants/destroy.html.erb
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
