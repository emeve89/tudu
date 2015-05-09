class Todo::Create

  def initialize(user, listener)
    @listener = listener
    @user = user.extend(Todoer)
  end

  def call(params, callbacks)
    @user.create_todo(params, callbacks)
  end

  module Todoer
    def create_todo(params, callbacks)
      self.todos.create!(params)
      callbacks[:success].call
    rescue
      callbacks[:failure].call
    end
  end

end
