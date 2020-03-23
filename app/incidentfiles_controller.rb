class IncidentfilesController < ApplicationController
  before_action :set_incidentfile, only: [:show, :edit, :update, :destroy]

  # GET /incidentfiles
  # GET /incidentfiles.json
  def index
    @incidentfiles = Incidentfile.all
  end

  # GET /incidentfiles/1
  # GET /incidentfiles/1.json
  def show
  end

  # GET /incidentfiles/new
  def new
    @incidentfile = Incidentfile.new
  end

  # GET /incidentfiles/1/edit
  def edit
  end

  # POST /incidentfiles
  # POST /incidentfiles.json
  def create
    @incidentfile = Incidentfile.new(incidentfile_params)

    respond_to do |format|
      if @incidentfile.save
        format.html { redirect_to @incidentfile, notice: 'Incidentfile was successfully created.' }
        format.json { render :show, status: :created, location: @incidentfile }
      else
        format.html { render :new }
        format.json { render json: @incidentfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidentfiles/1
  # PATCH/PUT /incidentfiles/1.json
  def update
    respond_to do |format|
      if @incidentfile.update(incidentfile_params)
        format.html { redirect_to @incidentfile, notice: 'Incidentfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @incidentfile }
      else
        format.html { render :edit }
        format.json { render json: @incidentfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidentfiles/1
  # DELETE /incidentfiles/1.json
  def destroy
    @incidentfile.destroy
    respond_to do |format|
      format.html { redirect_to incidentfiles_url, notice: 'Incidentfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidentfile
      @incidentfile = Incidentfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidentfile_params
      params.require(:incidentfile).permit(:incident_id, :filetype, :state)
    end
end
