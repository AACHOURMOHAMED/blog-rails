class ApplicationController < ActionController::Base
  def current_user
    @user = User.find(2)
  end
end
