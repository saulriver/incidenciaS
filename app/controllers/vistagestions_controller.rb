class VistagestionsController < ApplicationController
    before_action :authenticate_login!
    before_action :authenticate_role_user
    before_action :set_vistagestion, only: [:index, :edit, :new, :create, :destroy]

    def index
      @vistagestions = Vistagestion.all
    end



  def show
  end


  def new

  end


  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vistagestion
      @vistagestion = Vistagestion.all
    end

    def authenticate_role_user
      unless current_login.user.role_id == 1
        redirect_to root_path
      end
    end
end
