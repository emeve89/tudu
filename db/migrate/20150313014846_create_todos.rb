class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :content
      t.references :user, index: true
      t.boolean :done

      t.timestamps null: false
    end
    add_foreign_key :todos, :users
  end
end
