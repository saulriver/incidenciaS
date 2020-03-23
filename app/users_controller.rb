class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.page(params[:page]).per(5)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @userclients = Userclient.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario guardado correctamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuario actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def user_client_index
    
    @user = User.find(params[:id])    
    @userclients = Userclient.where("user_id = ?", @user.id) 
    @clients = Client.all    
    @userclient = Userclient.new
    render "userclients/index"

  end

   def user_client_create
    
    @clientuser = Userclient.new(userclient_params)

    if @clientuser.save
      @user = User.find(params[:id]) 
      redirect_to user_client_index_path(@user.id)
    else
      render json: { error: @clientuser.errors.full_messages }, status: :bad_request
    end

  end

  def user_client_destroy

    @userclient = Userclient.find(params[:userclient_id])
    if @userclient.destroy
      @user = User.find(params[:id]) 
      redirect_to user_client_index_path(@user.id)
    end
    
  end

  def user_area_index
    
    @userareas = Userarea.page(params[:page]).per(5)
    @areas = Area.all
    @user = User.find(params[:id]) 
    @userarea = Userarea.new
    render "userareas/index"

  end

   def user_area_create
    
    @areauser = Userarea.new(userarea_params)

    if @areauser.save
      @user = User.find(params[:id]) 
      redirect_to user_area_index_path(@user.id)
      else
        render json: { error: @areauser.errors.full_messages }, status: :bad_request
    end

  end

  def user_area_destroy

    @userarea = Userarea.find(params[:userarea_id])
    if @userarea.destroy
      @user = User.find(params[:id]) 
      redirect_to user_area_index_path(@user.id)
    end
    
  end

  def user_application_index
    
    @userapplications = Userapplication.page(params[:page]).per(5)
    @applicationclients = Applicationclient.all
    @user = User.find(params[:id]) 
    @userapplication = Userapplication.new
    render "userapplications/index"

  end

   def user_application_create
    
    @applicationuser = Userapplication.new(userapplication_params)

    if @applicationuser.save
      @user = User.find(params[:id]) 
      redirect_to user_application_index_path(@user.id)
    else
      render json: { error: @applicationuser.errors.full_messages }, status: :bad_request
    end

  end

  def user_application_destroy

    @userapplication = Userapplication.find(params[:userapplication_id])
    if @userapplication.destroy
      @user = User.find(params[:id]) 
      redirect_to user_application_index_path(@user.id)
    end

  end

  def application_operator_index
    
    @applicationoperators = Applicationoperator.page(params[:page]).per(5)
    @applications = Application.all
    @user = User.find(params[:id]) 
    @applicationoperator = Applicationoperator.new
    render "applicationoperators/index"

  end

   def application_operator_create
    
    @applicationoperator = Applicationoperator.new(applicationoperator_params)

    if @applicationoperator.save
      @user = User.find(params[:id]) 
      redirect_to application_operator_index_path(@user.id)
    else
      render json: { error: @applicationoperator.errors.full_messages }, status: :bad_request
    end

  end

  def application_operator_destroy

    @applicationoperator = Applicationoperator.find(params[:applicationoperator])
    if @applicationoperator.destroy
      @user = User.find(params[:id]) 
      redirect_to application_operator_index_path(@user.id)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :mail, :role_id, :username, :password, :change_password, :state. :page)
    end

     def userclient_params
       params.require(:userclient).permit(:user_id, :state, :client_id)
    end
    def userarea_params
      params.require(:userarea).permit(:user_id, :state, :area_id)
   end
   def userapplication_params
      params.require(:userapplication).permit(:user_id, :state, :applicationclient_id)
  end

  def applicationoperator_params
      params.require(:applicationoperator).permit(:user_id, :application_id, :state)
    end
end
