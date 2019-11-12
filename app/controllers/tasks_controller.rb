class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    find_task
    if @task.completed == true
      @completed = "Completed"
    else
      @completed = "Not completed"
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    find_task
  end

  def update
    find_task
    if @task.update(task_params)
      redirect_to task_path
    else
      render :edit
    end
  end

  def destroy
    find_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
