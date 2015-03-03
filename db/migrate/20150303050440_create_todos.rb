class CreateTodos < ActiveRecord::Migration
  def change
    create_table :create_todos do |t|
      t.string :list
      t.boolean :task_complete
      t.timestamps null: false
    end
  end
end
