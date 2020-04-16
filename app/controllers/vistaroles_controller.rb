class VistarolesController < ApplicationController
  before_action :authenticate_login!
  before_action :authenticate_role_user
    before_action :set_vistarole, only: [:index]

    def index
      @vistaroles = Vistarole.all
    end

    
 
  def show
  end

  
  def new
   
  end

 
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vistarole
      @vistarole = Vistarole.all
    end

    def authenticate_role_user
      unless current_login.user.role_id == 3
        redirect_to root_path
      end      
    end
    
end