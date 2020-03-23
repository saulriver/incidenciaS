class IncidentmanagementsController < ApplicationController
  before_action :set_incidentmanagement, only: [:show, :edit, :update, :destroy]

  # GET /incidentmanagements
  # GET /incidentmanagements.json
  def index
    @incidentmanagements = Incidentmanagement.all
  end

  # GET /incidentmanagements/1
  # GET /incidentmanagements/1.json
  def show
  end

  # GET /incidentmanagements/new
  def new
    @incidentmanagement = Incidentmanagement.new
  end

  # GET /incidentmanagements/1/edit
  def edit
  end

  # POST /incidentmanagements
  # POST /incidentmanagements.json
  def create
    @incidentmanagement = Incidentmanagement.new(incidentmanagement_params)

    respond_to do |format|
      if @incidentmanagement.save
        format.html { redirect_to @incidentmanagement, notice: 'Incidentmanagement was successfully created.' }
        format.json { render :show, status: :created, location: @incidentmanagement }
      else
        format.html { render :new }
        format.json { render json: @incidentmanagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidentmanagements/1
  # PATCH/PUT /incidentmanagements/1.json
  def update
    respond_to do |format|
      if @incidentmanagement.update(incidentmanagement_params)
        format.html { redirect_to @incidentmanagement, notice: 'Incidentmanagement was successfully updated.' }
        format.json { render :show, status: :ok, location: @incidentmanagement }
      else
        format.html { render :edit }
        format.json { render json: @incidentmanagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidentmanagements/1
  # DELETE /incidentmanagements/1.json
  def destroy
    @incidentmanagement.destroy
    respond_to do |format|
      format.html { redirect_to incidentmanagements_url, notice: 'Incidentmanagement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidentmanagement
      @incidentmanagement = Incidentmanagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidentmanagement_params
      params.require(:incidentmanagement).permit(:user_id, :incident_id, :datereport, :description, :state)
    end
end
