class StatisticreportsController < ApplicationController
    before_action :authenticate_login!
    before_action :authenticate_role_user
    before_action :set_statisticreport, only: [:index]

  def index
    @incidents = Incident.joins({userapplication: :user})
    .where("incidents.user_id = #{current_login.user.id}")
    .group(:name).count
    
    @applications = Incident.joins(userapplication: {applicationclient: :application})
    .where("incidents.user_id = #{current_login.user.id}")
    .group(:name).count

    @areas = Incident.joins(:area)
    .where("incidents.user_id = #{current_login.user.id}")
    .group(:name).count

    @incidentsmonths = Incident.joins({userapplication: :user})
    .where("incidents.user_id = #{current_login.user.id}")
    .group_by_month(:created_at, format: "%B %Y").count

    @incidentsdays = Incident.joins({userapplication: :user})
    .where("incidents.user_id = #{current_login.user.id}")
    .group_by_day(:created_at, format: "%Y %B %d %A" ).count

    #@incidentmanagement.state == "cerrada"
   end


  def show
  end


  def new

  end


  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statisticreport
      @statisticreport = Statisticreport.all
    end

    def authenticate_role_user
      unless current_login.user.role_id == 2
        redirect_to root_path
      end
    end
end
