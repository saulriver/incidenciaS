class VistaclientesController < ApplicationController
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

end