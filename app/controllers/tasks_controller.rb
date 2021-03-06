class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
    
  def index
       @tasks = Task.order(id: :desc).page(params[:page]).per(5)
  end

  def show
      
  end

  def new
      @task = Task.new
  end

  def create
      @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクリスト が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクリスト が作成されませんでした'
      render :new
    end
  end

  def edit
      
  end

  def update
      
    if @task.update(task_params)
      flash[:success] = 'タスクリスト は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクリスト は更新されませんでした'
      render :edit
    end
  end

  def destroy
    
    @task.destroy

    flash[:success] = 'タスクリストは正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end

end
