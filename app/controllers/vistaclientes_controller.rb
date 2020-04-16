class VistaclientesController < ApplicationController
  before_action :authenticate_login!
  before_action :authenticate_role_user
    before_action :set_vistacliente, only: [:index]

    def index
      @vistaclientes = Vistacliente.all
    end

    
 
  def show
  end

  
  def new
   
  end

 
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_vistacliente
      @vistacliente = Vistacliente.all
  end
  
  def authenticate_role_user
    unless current_login.user.role_id == 3
      redirect_to root_path
    end      
  end

end