class TasksController < ApplicationController
  def index
    @tasks = Task.order(position: :asc)
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
    @task = Task.create(completed: params[:task][:completed],
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

  def update
  end

  def destroy
  end

end
