class TodosController < ApplicationController
before_action :set_user_todos, only: [:update, :destroy]
before_action :set_user
  def index
    @todo = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to user_todos_path(@todo), notice: 'todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def update
    @todo.update(todo_params)
  end

  def destroy
    @todo.delete
    redirect_to user_todos_path
  end

  def edit
  end

private
    def set_user
      @user = current_user
    end

    def set_user_todos
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:list,:user_id)
    end

end
