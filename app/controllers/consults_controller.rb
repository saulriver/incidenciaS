class ConsultsController < ApplicationController
  
  def index
    incidentmanagement = "%#{params[:incidentmanagement]}%"
    if incidentmanagement.nil?
      @incidentmanagements = Incidentmanagement.all
    else
      @incidentmanagements = Incidentmanagement.where("created_at LIKE ? ", incidentmanagement).page(params[:page]).per(10)
    end
  end

      # Never trust parameters from the scary internet, only allow the white list through.
      def consult_params
        params.require(:consult).permit( :incidentmanagement_id, :page)
      end

end
