class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
def index
    if params[:search].present?
    @users = User.where("name LIKE ?", "%#{params[:search]}%").page params[:page]
  else
    @users = User.page(params[:page]).per(5)
    @incidents_count = Incident.group(:user_id).count
      @incidents_date = Incident.group(:created_at).count
    end
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
    @login = Login.new(login_params)
    @user.login = @login
    respond_to do |format|
      if @user.save && @login.save
        format.html { redirect_to users_path(@user), info: 'Usuario guardado correctamente.' }
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
      if @user.update(user_params) && @login.update(login_params)
        format.html { redirect_to users_path(@user), success: 'Usuario actualizado correctamente.' }
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
    @login.destroy
    respond_to do |format|
      format.html { redirect_to users_url, danger: 'Usuario eliminado correctamente.' }
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
      redirect_to user_client_index_path(@user.id), info: 'Usuario cliente guardado correctamente.' 
     else
      render json: { error: @clientuser.errors.full_messages }, status: :bad_request
    end
end

  def user_client_destroy

    @userclient = Userclient.find(params[:userclient_id])
    if @userclient.destroy
      @user = User.find(params[:id])
      redirect_to user_client_index_path(@user.id), danger: 'Usuario cliente eliminado correctamente.' 
    end

  end

  def user_area_index
    @user = User.find(params[:id])
    @userareas = @user.userareas.page(params[:page]).per(5)
    @areas = Area.all
    @userarea = Userarea.new
    render "userareas/index"
  end

def user_area_create
  @areauser = Userarea.new(userarea_params)
  if @areauser.save
      @user = User.find(params[:id])
      @userareas = @user.userareas.page(params[:page]).per(5)
      redirect_to user_area_index_path(@user.id), info: 'Userarea was successfully created.'
  else
    render json: { error: @areauser.errors.full_messages }, status: :bad_request
  end
end


  def user_application_index
    @user = User.find(params[:id])
    @userapplications = @user.userapplications.page(params[:page]).per(5)
    @client = @user.userclients.last
    @applicationclients = @client.client.applicationclients
    @userapplication = Userapplication.new
    render "userapplications/index"
  end

def user_application_create
@applicationuser = Userapplication.new(userapplication_params)
  if @applicationuser.save
   @user = User.find(params[:id])
    redirect_to user_application_index_path(@user.id), info: 'Usuario aplicación guardado correctamente.' 
    else
    render json: { error: @applicationuser.errors.full_messages }, status: :bad_request
  end
end

def user_application_destroy
    @userapplication = Userapplication.find(params[:userapplication_id])
    if @userapplication.destroy
      @user = User.find(params[:id])
      respond_to do |format|#parametro para mostrar en pdf
        format.html { render "users/index", danger: 'Userapplication was successfully destroyed'}
        format.json {}      
     end
    end
end

  def application_operator_index
    @user = User.find(params[:id])
    @applicationoperators = @user.applicationoperators.page(params[:page]).per(5)
    @applications = Applicationclient.all
    @applicationoperator = Applicationoperator.new
    render "applicationoperators/index"
  end

def application_operator_create
 @applicationoperator = Applicationoperator.new(applicationoperator_params)
  if @applicationoperator.save
     @user = User.find(params[:id])
      redirect_to application_operator_index_path(@user.id), info: 'Aplicación operador guardado correctamente.' 
    else
      render json: { error: @applicationoperator.errors.full_messages }, status: :bad_request
  end
end

def application_operator_destroy
    @applicationoperator = Applicationoperator.find(params[:applicationoperator])
  if @applicationoperator.destroy
     @user = User.find(params[:id])
      redirect_to application_operator_index_path(@user.id), danger: 'Aplicación operador eliminado correctamente.' 
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @login = Login.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :role_id, :username, :password, :change_password, :state, :page, :search)
    end

    def login_params
      params.require(:user).permit(:email, :username, :password)
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
