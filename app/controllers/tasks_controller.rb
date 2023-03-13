class TasksController < ApplicationController
  before_action :require_login
  before_action :user_check, {only: [:edit, :update, :destroy, :show]}

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

	def update
    @task.update(task_params)
		redirect_to tasks_path
	end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
	end

  def show
  end
  
  private
    def task_params
      params.require(:task).permit(:title, :done)
    end

    def user_check
      @task = current_user.tasks.find_by(id: params[:id])
      if @task.nil?
        redirect_to tasks_path and return
      end
    end
end
