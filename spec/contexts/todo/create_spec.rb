require 'rails_helper'

describe Todo::Create do
  describe '#call' do
    let(:user) { User.create(email: 'test@test.com', password: '123123123', password_confirmation: '123123123') }
    let(:listener) { double('listener') }
    let(:context) { described_class.new(user, listener)  }
    let(:params) do
      {
        content: 'content'
      }
    end
    let(:invalid_params) do
      {
        content: ''
      }
    end
    let(:callbacks) do
      {
        success: spy('success_callback'),
        failure: spy('failure_callback')
      }
    end

    context 'with valid arguments' do
      it 'creates a todo' do
        expect{context.call(params, callbacks)}.to change{user.todos.size}.by(1) 
      end
      it 'calls callbacks[:success]' do
        context.call(params, callbacks)
        expect(callbacks[:success]).to have_received(:call)
      end
    end
    context 'with invalid arguments' do
      it 'does not create a todo' do
        expect{context.call(invalid_params, callbacks)}.to_not change{user.todos.size} 
      end
      it 'calls callbacks[:failure]' do
        context.call(invalid_params, callbacks)
        expect(callbacks[:failure]).to have_received(:call)
      end
    end
  end
end
