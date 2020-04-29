class ApplicationclientsController < ApplicationController
  before_action :authenticate_login!
  before_action :authenticate_role_user  
  before_action :set_applicationclient, only: [:show, :edit, :update, :destroy]

  # GET /applicationclients
  # GET /applicationclients.json
  def index
    @applicationclients = Applicationclient.page(params[:page]).per(5)
  end

  # GET /applicationclients/1
  # GET /applicationclients/1.json
  def show
  end

  # GET /applicationclients/new
  def new
    @applicationclient = Applicationclient.new
  end

  # GET /applicationclients/1/edit
  def edit
  end

  # POST /applicationclients
  # POST /applicationclients.json
  def create
    @applicationclient = Applicationclient.new(applicationclient_params)

    respond_to do |format|
      if @applicationclient.save
        format.html { redirect_to @applicationclient, info: 'Aplicación cliente ha sido creada correctamente.' }
        format.json { render :show, status: :created, location: @applicationclient }
      else
        format.html { render :new }
        format.json { render json: @applicationclient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicationclients/1
  # PATCH/PUT /applicationclients/1.json
  def update

    respond_to do |format|
      if @applicationclient.update(applicationclient_params)
        format.html { redirect_to client_application_client_index_url(:id => applicationclient_params[:client_id]), info: "Aplicación cliente a sido actualizado correctamente." }
        format.json { render :show, status: :ok, location: @applicationclient }
      else
        format.html { render :edit }
        format.json { render json: @applicationclient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicationclients/1
  # DELETE /applicationclients/1.json
  def destroy
    @applicationclient = Applicationclient.find(params[:id])
    @applicationclient.destroy
    respond_to do |format|
      format.html { redirect_to clients_path(:id), info: 'Aplicación cliente fue destruida con éxito'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicationclient
      @applicationclient = Applicationclient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicationclient_params
      params.require(:applicationclient).permit(:user_id, :application_id, :client_id, :servicelevel, :state, :page)
    end

    def authenticate_role_user
      unless current_login.user.role_id == 3
        redirect_to root_path
      end      
    end
    
end
