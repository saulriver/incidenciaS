class WelcomeController < ApplicationController
  before_action :authenticate_login!
  before_action :authenticate_role_user
  def index
  end

  def authenticate_role_user
    unless current_login.user.role_id == 2 || current_login.user.role_id == 1 || current_login.user.role_id == 3
      redirect_to root_path
    end      
  end
  
end
