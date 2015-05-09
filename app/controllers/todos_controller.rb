class TodosController < ApplicationController

  def create
    context = Todo::Create.new(current_user, self)
    context.call(todo_params, {
      success: -> { redirect_to root_path, notice: 'Good!' },
      failure: -> { redirect_to root_path, alert: 'Bad!' }
      }
    )
  end

  private

  def todo_params
    params.require(:todo).permit(:content)
  end

end
