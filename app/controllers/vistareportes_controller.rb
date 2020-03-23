class VistareportesController < ApplicationController
    before_action :authenticate_login!
    before_action :authenticate_role_user
    before_action :set_vistareporte, only: [:index]

    def index
      @vistareportes = Vistareporte.all
    end



  def show
  end


  def new

  end


  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vistareporte
      @vistareporte = Vistareporte.all
    end

    def authenticate_role_user
      unless current_login.user.role_id == 2
        redirect_to root_path
      end
    end
end
