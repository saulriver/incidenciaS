class UserapplicationsController < ApplicationController
  before_action :set_userapplication, only: [:show, :edit, :update, :destroy]

  # GET /userapplications
  # GET /userapplications.json
  def index
    @userapplications = Userapplication.all
  end

  # GET /userapplications/1
  # GET /userapplications/1.json
  def show
  end

  # GET /userapplications/new
  def new
    @userapplication = Userapplication.new
  end

  # GET /userapplications/1/edit
  def edit
    @userapplication = Userapplication.find(params[:id])
  end

  # POST /userapplications
  # POST /userapplications.json
  def create
    @userapplication = Userapplication.new(userapplication_params)

    respond_to do |format|
      if @userapplication.save
        format.html { redirect_to @userapplication, notice: 'Userapplication was successfully created.' }
        format.json { render :show, status: :created, location: @userapplication }
      else
        format.html { render :new }
        format.json { render json: @userapplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userapplications/1
  # PATCH/PUT /userapplications/1.json
  def update
    respond_to do |format|
      if @userapplication.update(userapplication_params)
        format.html { redirect_to @userapplication, notice: 'Actualizada.' }
        format.json { render :show, status: :ok, location: @userapplication }
      else
        format.html { render :edit }
        format.json { render json: @userapplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userapplications/1
  # DELETE /userapplications/1.json
  def destroy
    @userapplication.destroy
    respond_to do |format|
      format.html { redirect_to userapplications_url, notice: 'Userapplication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userapplication
      @userapplication = Userapplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userapplication_params
      params.require(:userapplication).permit(:user_id, :applicationclient_id, :application_id, :client_id, :state)
    end
end
