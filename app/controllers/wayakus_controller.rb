 class WayakusController < ApplicationController
  before_action :set_wayaku, only: [:show, :edit, :update, :destroy]
  #before_action :restrict_access, except: [:index,:regist,:index]


  # GET /wayakus
  # GET /wayakus.json
  def index
    if params[:page]
      @wayakus = Wayaku.page(params[:page]).per(5).order("created_at DESC")
    else
      @wayakus = Wayaku.all
    end

  end

  # GET /wayakus/1
  # GET /wayakus/1.json
  def show
  end

  # GET /wayakus/new
  def new
    @wayaku = Wayaku.new
  end

  # GET /wayakus/1/edit
  def edit
  end

  def regist
    @reg = ApiKey.new(regist_params)
    if @reg.save
      render json: @reg
    else
      render json: @reg.errors
    end
  end


  # POST /wayakus
  # POST /wayakus.json
  def create
    @wayaku = Wayaku.new(wayaku_params)

    respond_to do |format|
      if @wayaku.save
        format.html { redirect_to @wayaku, notice: 'Wayaku was successfully created.' }
        format.json { render :show, status: :created, location: @wayaku }
      else
        format.html { render :new }
        format.json { render json: @wayaku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wayakus/1
  # PATCH/PUT /wayakus/1.json
  def update
    respond_to do |format|
      if @wayaku.update(wayaku_params)
        format.html { redirect_to @wayaku, notice: 'Wayaku was successfully updated.' }
        format.json { render :show, status: :ok, location: @wayaku }
      else
        format.html { render :edit }
        format.json { render json: @wayaku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wayakus/1
  # DELETE /wayakus/1.json
  def destroy
    @wayaku.destroy
    respond_to do |format|
      format.html { redirect_to wayakus_url, notice: 'Wayaku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def restrict_access
      authenticate_or_request_with_http_token do |token,option|
        ApiKey.exists?(access_token: token)
      end
    end


    def regist_params
      params.require(:api_key).permit(:user_name,:uuid,:invitation_code)
    end


    def set_wayaku
      @wayaku = Wayaku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wayaku_params
      params.require(:wayaku).permit(:post_id, :post_type, :selected_category, :questionBody, :answer_of_user)
    end
end
