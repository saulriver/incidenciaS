class VistarolesController < ApplicationController
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
end