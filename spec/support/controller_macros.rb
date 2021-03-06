module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = User.create
      user.confirm!
      sign_in user 
    end
  end
end
