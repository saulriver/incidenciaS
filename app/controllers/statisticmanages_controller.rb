class StatisticmanagesController < ApplicationController
    before_action :authenticate_login!
    before_action :authenticate_role_user
    before_action :set_statisticmanage, only: [:index]

    def index
      @incidentmanagements = Incidentmanagement.joins(incident: {userapplication: :user})
      .where("incidentmanagements.user_id = #{current_login.user.id}")
      .group(:name).count

      @applications = Incidentmanagement.joins(incident: {userapplication: {applicationclient: :application}})
      .where("incidentmanagements.user_id = #{current_login.user.id}")
      .group(:name).count

      @areas = Incidentmanagement.joins({incident: :area})
      .where("incidentmanagements.user_id = #{current_login.user.id}")
      .group(:name).count

      @clients = Incidentmanagement.joins(incident: {userapplication: {applicationclient: :client}})
      .where("incidentmanagements.user_id = #{current_login.user.id}")
      .group(:name).count

      @months = Incidentmanagement.joins(incident: {userapplication: {applicationclient: :application}})
      .where("incidentmanagements.user_id = #{current_login.user.id}")
      .group(:state).count

    end



  def show
  end


  def new

  end


  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statisticmanage
      @statisticmanage = Statisticmanage.all
    end

    def authenticate_role_user
      unless current_login.user.role_id == 1
        redirect_to root_path
      end
    end
end
