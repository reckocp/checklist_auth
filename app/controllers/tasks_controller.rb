class TasksController < ApplicationController
  skip_before_action :authoricate_user, :except => :show

  def index
    @tasks = Task.order(:id, position: :asc)
    @task = Task.new
  end

  def show
    task = Task.find(params[:id])
    if task
      @task = task
    else
      render_not_found
    end
  end

  def new
    redirect_to root_path
  end

  def create
    @task = Task.new(completed: params[:task][:completed],
               body: params[:task][:body],
               position:params[:task][:position])
    @task.completed = false

    if @task.save
      flash[:notice] = "Task added"
      redirect_to root_path
    else
      flash[:alert] = "Task could not be saved"
      @tasks = Task.order(position: :asc)
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    Task.update(params[:id], task_params)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

private

  def task_params
    params.require(:task).permit(:body, :position, :completed)
  end
end
