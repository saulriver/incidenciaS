class StatisticreportsController < ApplicationController
    before_action :authenticate_login!
    before_action :authenticate_role_user
    before_action :set_statisticreport, only: [:index]

    def index
      @incidents = Incident.joins(userapplication: {applicationclient: :application})
      .where("incidents.user_id = #{current_login.user.id}")
      .group(:name).count

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
