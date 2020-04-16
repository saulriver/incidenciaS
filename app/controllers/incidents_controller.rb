class IncidentsController < ApplicationController
  #protect_from_forgery except: :index
  before_action :authenticate_login!
  before_action :authenticate_role_user
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  
  # GET /incidents
  # GET /incidents.json
  def index
    #@incidents = Incident.where("incidents.user_id = #{current_login.user.id}").order("incidents.id DESC").page(params[:page]).per(5)
    #@incidents = Incident.joins(:incidentmanagements).where("incidents.user_id = #{current_login.user.id}").order("incidentmanagements.user_id DESC").page(params[:page]).per(5)
    @incidentmanagements = Incidentmanagement.joins(:incident).where("incidents.user_id = #{current_login.user.id}").order("incidents.id DESC").page(params[:page]).per(5)
    if params[:q].present?
      @incidents = @incidents.joins(:area, userapplication: [{applicationclient: :application}]).where("applications.name like :q or areas.name like :q", q: "%#{params[:q]}%").page params[:page]
      # flash[:success] = "Busqueda correctamente"
      # else
      #   flash[:alert] = "Problemas con la grabación"
      @incidents = Incident.joins(:incidentmanagements).where("incidentmanagements.user_id = #{current_login.user_id}").order("incidentmanagements.user_id DESC").page(params[:page]).per(5)    
    end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
  end

  # GET /incidents/1/edit
  def edit
    @incident = Incident.find(params[:id])
    @incidentmanagements = @incident.incidentmanagements
    Rails.logger.debug("ID incident: #{@incident.id}")
    @incidentmanagement = Incidentmanagement.find_by(incident_id: @incident)
    Rails.logger.debug("ID incidentmanagement: #{@incidentmanagement.description}")
  end


  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)
    @user = User.joins(:userareas).where("userareas.area_id = #{@incident.area_id}").sample
    @adminUsers = User.where("role_id = 3").sample 
    if @incident.save
        Rails.logger.debug(@incident.created_at + @incident.userapplication.applicationclient.servicelevel.hours)
        tlevel = @incident.created_at + @incident.userapplication.applicationclient.servicelevel.hours
        littletime = tlevel - 1.hours
        overtime = tlevel - (@incident.userapplication.applicationclient.servicelevel/2).hours
        if @user.nil?
          @incidentmanagement = Incidentmanagement.create(Tlevel: tlevel, user: @adminUsers, incident: @incident, Littletime: littletime, Overtime: overtime)
        else
          @incidentmanagement = Incidentmanagement.create(Tlevel: tlevel, user: @user, incident: @incident, Littletime: littletime, Overtime: overtime)
        end
        
        respond_to do |format|
            if @incidentmanagement.save
            format.html { redirect_to new_incident_path(@incidentmanagement), info: 'La incidencia se creó con éxito.' }
            format.json { render :show, status: :created, location: @incidentmanagement }
          else
            format.html { render :new, info: 'La incidencia se actualizó correctamente.' }
            format.json { render json: @incidentmanagement.errors, status: :unprocessable_entity }
          end
        end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { render :edit, info: 'La incidencia se actualizó correctamente.' }
        format.json { render :edit, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, info: 'La incidencia fue destruida exitosamente.' }
      format.json { head :no_content }
    end
  end

  def gestionar_incident
   
    @incidentmanagement = Incidentmanagement.find(params[:id])
    Rails.logger.debug("entroooo: #{@incidentmanagement.state}")
    
    incidentmanagement = @incidentmanagement
    incidentmanagement.gestionar!

    redirect_to edit_incidentmanagement_path(@incidentmanagement), status: 302, notice: "Se ha gestionado la incidencia" 

  end

  def terminar_incident
   
    @incidentmanagement = Incidentmanagement.find(params[:id])   
    
    incidentmanagement = @incidentmanagement
    incidentmanagement.terminar!

    redirect_to edit_incidentmanagement_path(@incidentmanagement), status: 302, notice: "Se ha terminado de gestionar la incidencia" 
       
  end

  def aprobar_incident
   
    @incidentmanagement = Incidentmanagement.find(params[:id])   
    
    incidentmanagement = @incidentmanagement
    incidentmanagement.aprobar!

    redirect_to edit_incident_path(@incidentmanagement), status: 302, notice: "Incidencia aprobada" 
       
  end

  def rechazar_incident
   
    @incidentmanagement = Incidentmanagement.find(params[:id])   
    
    incidentmanagement = @incidentmanagement
    incidentmanagement.rechazar!

    redirect_to edit_incident_path(@incidentmanagement), status: 302, notice: "Incidencia rechazada" 
       
  end

  def abrir_incident
   
    @incidentmanagement = Incidentmanagement.find(params[:id])   
    
    incidentmanagement = @incidentmanagement
    incidentmanagement.abrir!

    redirect_to edit_incidentmanagement_path(@incidentmanagement), status: 302, notice: "Incidencia abierta" 
       
  end

  def cerrar_incident
   
    @incidentmanagement = Incidentmanagement.find(params[:id])   
    
    incidentmanagement = @incidentmanagement
    incidentmanagement.cerrar!

    redirect_to edit_incidentmanagement_path(@incidentmanagement), status: 302, notice: "Incidencia cerrada" 
       
  end

  #private def set_time_zone
   # if logged_in?
    #   Time.use_zone(current_login.user.time_zone) { yield }
    #else
    #   yield
    #end
 #end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:user_id, :area_id, :userapplication_id, :criticality_id, :datereport, :description, :state, :application_id, :applicationclient_id, :page, :search, images:[])
    end

    def authenticate_role_user
      unless current_login.user.role_id == 2 || current_login.user.role_id == 1 || current_login.user.role_id == 3
        redirect_to root_path
      end      
    end
end
