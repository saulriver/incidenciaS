class CriticalitiesController < ApplicationController
  before_action :authenticate_login!
  before_action :authenticate_role_user
  before_action :set_criticality, only: [:show, :edit, :update, :destroy]

  # GET /criticalities
  # GET /criticalities.json
  def index
    @criticalities = Criticality.all
  end

  # GET /criticalities/1
  # GET /criticalities/1.json
  def show
  end

  # GET /criticalities/new
  def new
    @criticality = Criticality.new
  end

  # GET /criticalities/1/edit
  def edit
  end

  # POST /criticalities
  # POST /criticalities.json
  def create
    @criticality = Criticality.new(criticality_params)
    respond_to do |format|
      if @criticality.save
        format.html { redirect_to criticalities_path(@criticality), info: 'Criticidad creada con éxito.' }
        format.json { render :show, status: :created, location: @criticality }
      else
        format.html { render :new }
        format.json { render json: @criticality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criticalities/1
  # PATCH/PUT /criticalities/1.json
  def update
    respond_to do |format|
      if @criticality.update(criticality_params)
        format.html { redirect_to criticalities_path(@criticality), success: 'Criticidad actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @criticality }
      else
        format.html { render :edit }
        format.json { render json: @criticality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criticalities/1
  # DELETE /criticalities/1.json
  def destroy
    @criticality.destroy
    respond_to do |format|
      format.html { redirect_to criticalities_url, danger: 'Criticidad destruida con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criticality
      @criticality = Criticality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criticality_params
      params.require(:criticality).permit( :name, :state)
    end

    def authenticate_role_user
      unless current_login.user.role_id == 3
        redirect_to root_path
      end      
    end
    
end
