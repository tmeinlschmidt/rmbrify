module ControllerMacros
  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in Fabricate.create(:admin) # Using factory girl as an example
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = Fabricate.create(:user)
    sign_in user
  end
end
