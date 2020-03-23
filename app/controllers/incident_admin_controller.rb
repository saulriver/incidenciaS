class IncidentAdminController < ApplicationController
    before_action :authenticate_login!
    before_action :authenticate_role_user
    before_action :set_statisticmanage, only: [:index]


    def incident_admin 
      Rails.logger.debug("Entrooooooooooo")
        @incidentmanagements = Incidentmanagement.joins(:incident).where("incidentmanagements.user_id = #{current_login.user.id}").order("incidents.id DESC").page(params[:page]).per(5)
        if params[:q].present?
          @incidents = @incidents.joins(:area, userapplication: [{applicationclient: :application}]).where("applications.name like :q or areas.name like :q", q: "%#{params[:q]}%")
          # flash[:success] = "Busqueda correctamente"
          # else
          #   flash[:alert] = "Problemas con la grabación"
          @incidents = Incident.joins(:incidentmanagements).where("incidentmanagements.user_id = #{current_login.user_id}").order("incidentmanagements.user_id DESC").page(params[:page]).per(5)
          @incident.picture     
        end
        render "incidentAdmin/index"
     end

     
  # GET /incidents/1/edit
  def incident_admin_edit
    @incident = Incident.find(params[:id])
    Rails.logger.debug("ID incident: #{@incident.id}")
    @incidentmanagement = Incidentmanagement.find_by(incident_id: @incident)
    Rails.logger.debug("ID incidentmanagement: #{@incidentmanagement.description}")
    @incident.picture
    render "incidentAdmin/edit"
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
