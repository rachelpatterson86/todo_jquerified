class TodosController < ApplicationController
before_action :set_user_todos, only: [:update, :destroy]
  def index
    @todo = current_user.todos.all
  end

  def create
    @todo = current_user.todos.create(todo_params)
  end

  def update
    @todo.update(todo_params)
  end

  def destroy
    @todo.delete
  end

  def edit
  end

private
    def set_user_todos
      @todo = current_user.todos.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:list,:task_complete,:user_id)
    end

end
