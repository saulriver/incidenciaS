class UserareasController < ApplicationController
  before_action :set_userarea, only: [:show, :edit, :update, :destroy]

  # GET /userareas
  # GET /userareas.json
  def index
    @userareas = Userarea.all
  end

  # GET /userareas/1
  # GET /userareas/1.json
  def show
  end

  # GET /userareas/new
  def new
    @userarea = Userarea.new
  end

  # GET /userareas/1/edit
  def edit
  end

  # POST /userareas
  # POST /userareas.json
  def create
    @userarea = Userarea.new(userarea_params)

    respond_to do |format|
      if @userarea.save
        format.html { redirect_to @userarea, notice: 'Userarea was successfully created.' }
        format.json { render :show, status: :created, location: @userarea }
      else
        format.html { render :new }
        format.json { render json: @userarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userareas/1
  # PATCH/PUT /userareas/1.json
  def update
    respond_to do |format|
      if @userarea.update(userarea_params)
        format.html { redirect_to @userarea, notice: 'Userarea was successfully updated.' }
        format.json { render :show, status: :ok, location: @userarea }
      else
        format.html { render :edit }
        format.json { render json: @userarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userareas/1
  # DELETE /userareas/1.json
  def destroy
    @userarea.destroy
    respond_to do |format|
      format.html { redirect_to userareas_url, notice: 'Userarea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userarea
      @userarea = Userarea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userarea_params
      params.require(:userarea).permit(:user_id, :area_id, :state)
    end
end
