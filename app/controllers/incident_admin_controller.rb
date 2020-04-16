class IncidentAdminController < ApplicationController
    before_action :authenticate_login!
    before_action :authenticate_role_user
    before_action :set_incident_admin, only: [:index]

    def incident_admin 
      Rails.logger.debug("Entrooooooooooo")
      @incidentmanagements = Incidentmanagement.joins(:incident).where("incidentmanagements.user_id = #{current_login.user.id}").order("incidents.id DESC").page(params[:page]).per(5)
      if params[:q].present?
        @incidents = @incidents.joins(:area, userapplication: [{applicationclient: :application}]).where("applications.name like :q or areas.name like :q", q: "%#{params[:q]}%").page params[:page]
        # flash[:success] = "Busqueda correctamente"
        # else
        #   flash[:alert] = "Problemas con la grabación"
        @incidents = Incident.joins(:incidentmanagements).where("incidentmanagements.user_id = #{current_login.user_id}").order("incidentmanagements.user_id DESC").page(params[:page]).per(5)   
      end
  
      render "incidentAdmin/index"
  
    end

    def assign_incident 
      
      @areas = Area.all
      @incidentmanagement = Incidentmanagement.find(params[:id])
       
      #Rails.logger.debug("Entrooooooooooo, area: " + @incidentmanagement.incident.area.id.to_s)
     
      render "incidentAdmin/assign_incident", notice: "Incidencia asignada correctamente"
  
    end

    def listUserArea         
    
      @area_id = params[:area_id]
      @userareas = Userarea.where("area_id = #{@area_id}")     
     
      render :json => @userareas, :include => :user    
    end

    def incident_admin_assign_operator 
      
      #Rails.logger.debug("Entrooooooooooo: " + params[:incidentmanagement_id].to_s)
        @userOperator = User.find(params[:operador_id])
         @incidentmanagement = Incidentmanagement.find(params[:incidentmanagement_id])
      
      if @incidentmanagement.update_attributes(:user_id => @userOperator.id)
          output = {'error' => 'false', 'notice' => 'Se ha asignado exitosamente'}.to_json
           render :json => output
        else
          output = {'error' => 'true', 'notice' => 'Error al asiganar incidencia'}.to_json
           render :json => output
      end

     



  
    end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_incidentAdmin
    @incidentAdmin = IncidentAdmin.all
  end

  def authenticate_role_user
    unless current_login.user.role_id == 3
      redirect_to root_path
    end
  end
end
