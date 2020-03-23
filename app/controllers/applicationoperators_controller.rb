class ApplicationoperatorsController < ApplicationController
  before_action :set_applicationoperator, only: [:show, :edit, :update, :destroy]

  # GET /applicationoperators
  # GET /applicationoperators.json
  def index
    @applicationoperators = Applicationoperator.page(params[:page]).per(5)
  end

  # GET /applicationoperators/1
  # GET /applicationoperators/1.json
  def show
  end

  # GET /applicationoperators/new
  def new
    @applicationoperator = Applicationoperator.new
  end

  # GET /applicationoperators/1/edit
  def edit
  end

  # POST /applicationoperators
  # POST /applicationoperators.json
  def create
    @applicationoperator = Applicationoperator.new(applicationoperator_params)

    respond_to do |format|
      if @applicationoperator.save
        format.html { redirect_to @applicationoperator, info: 'Creado con Exito.' }
        format.json { render :show, status: :created, location: @applicationoperator }
      else
        format.html { render :new }
        format.json { render json: @applicationoperator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicationoperators/1
  # PATCH/PUT /applicationoperators/1.json
  def update
    respond_to do |format|
      if @applicationoperator.update(applicationoperator_params)
        format.html { redirect_to @applicationoperator, success: 'Actualizado.' }
        format.json { render :show, status: :ok, location: @applicationoperator }
      else
        format.html { render :edit }
        format.json { render json: @applicationoperator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicationoperators/1
  # DELETE /applicationoperators/1.json
  def destroy
    @applicationoperator.destroy
    respond_to do |format|
      format.html { redirect_to users_url, danger: 'Application Operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicationoperator
      @applicationoperator = Applicationoperator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicationoperator_params
      params.require(:applicationoperator).permit(:user_id, :application_id, :state)
    end
end
