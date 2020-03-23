class ManagefilesController < ApplicationController
  before_action :set_managefile, only: [:show, :edit, :update, :destroy]

  # GET /managefiles
  # GET /managefiles.json
  def index
    @managefiles = Managefile.all
  end

  # GET /managefiles/1
  # GET /managefiles/1.json
  def show
  end

  # GET /managefiles/new
  def new
    @managefile = Managefile.new
  end

  # GET /managefiles/1/edit
  def edit
  end

  # POST /managefiles
  # POST /managefiles.json
  def create
    @managefile = Managefile.new(managefile_params)

    respond_to do |format|
      if @managefile.save
        format.html { redirect_to @managefile, notice: 'Managefile was successfully created.' }
        format.json { render :show, status: :created, location: @managefile }
      else
        format.html { render :new }
        format.json { render json: @managefile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managefiles/1
  # PATCH/PUT /managefiles/1.json
  def update
    respond_to do |format|
      if @managefile.update(managefile_params)
        format.html { redirect_to @managefile, notice: 'Managefile was successfully updated.' }
        format.json { render :show, status: :ok, location: @managefile }
      else
        format.html { render :edit }
        format.json { render json: @managefile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managefiles/1
  # DELETE /managefiles/1.json
  def destroy
    @managefile.destroy
    respond_to do |format|
      format.html { redirect_to managefiles_url, notice: 'Managefile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managefile
      @managefile = Managefile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def managefile_params
      params.require(:managefile).permit(:incidentmanagement_id, :filetype, :state)
    end
end
