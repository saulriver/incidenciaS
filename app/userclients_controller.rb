class UserclientsController < ApplicationController
  before_action :set_userclient, only: [:show, :edit, :update, :destroy]

  # GET /userclients
  # GET /userclients.json
  def index
    @userclients = Userclient.page(params[:page]).per(5)
    @clients = Client.all
    
  end

  # GET /userclients/1
  # GET /userclients/1.json
  def show
  end

  # GET /userclients/new
  def new
    @userclient = Userclient.new
  end

  # GET /userclients/1/edit
  def edit
  end

  # POST /userclients
  # POST /userclients.json
  def create
    @userclient = Userclient.new(userclient_params)
    Rails.logger.debug("ID Usuario: #{@userclient.user.name}")
    
      if @userclient.save
       render json: @userclient
      else
        render :index, notice: "Error"
      end
   
  end

  # PATCH/PUT /userclients/1
  # PATCH/PUT /userclients/1.json
  def update
    respond_to do |format|
      if @userclient.update(userclient_params)
        format.html { redirect_to @userclient, notice: 'Userclient was successfully updated.' }
        format.json { render :show, status: :ok, location: @userclient }
      else
        format.html { render :edit }
        format.json { render json: @userclient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userclients/1
  # DELETE /userclients/1.json
  def destroy
   
    @userclient.destroy
    respond_to do |format|
      format.html { redirect_to user_client_index_path(), notice: 'Userclient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userclient
      @userclient = Userclient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userclient_params
      params.require(:userclient).permit(:client_id, :user_id, :state, :page)
    end
end
