class TasksController < ApplicationController
  before_action :require_user_logged_in
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(3)
    # binding.pry
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success] = "Taskが正常に投稿されました"
      redirect_to task_path(@task)
    else
      flash.now[:denger] = "Taskが投稿されませんでした。"
      render :new
    end
  end

  def edit
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = "Taskは正常に更新されました。"
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした。'
      render :edit
    end
    
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました。'
    redirect_to tasks_url
  end
  
  private
  
  # def set_task
  #   @task = current_user.tasks.find(params[:id])
  # end
  def set_task
    if current_user.tasks.exists?(params[:id])
      @task = current_user.tasks.find(params[:id])
    else
      flash[:danger] = "他ユーザのTaskにはアクセスできません。"
      redirect_to root_path
    end
  end
      
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end