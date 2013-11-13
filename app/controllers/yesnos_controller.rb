class YesnosController < ApplicationController
  before_action :set_yesno, only: [:show, :edit, :update, :destroy]

  # GET /yesnos
  # GET /yesnos.json
  def index
    @yesnos = Yesno.all
  end

  # GET /yesnos/1
  # GET /yesnos/1.json
  def show
  end

  # GET /yesnos/new
  def new
    @yesno = Yesno.new
  end

  # GET /yesnos/1/edit
  def edit
  end

  # POST /yesnos
  # POST /yesnos.json
  def create
    @yesno = Yesno.new(yesno_params)

    respond_to do |format|
      if @yesno.save
        format.html { redirect_to @yesno, notice: 'Yesno was successfully created.' }
        format.json { render action: 'show', status: :created, location: @yesno }
      else
        format.html { render action: 'new' }
        format.json { render json: @yesno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yesnos/1
  # PATCH/PUT /yesnos/1.json
  def update
    respond_to do |format|
      if @yesno.update(yesno_params)
        format.html { redirect_to @yesno, notice: 'Yesno was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @yesno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yesnos/1
  # DELETE /yesnos/1.json
  def destroy
    @yesno.destroy
    respond_to do |format|
      format.html { redirect_to yesnos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yesno
      @yesno = Yesno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yesno_params
      params.require(:yesno).permit(:name, :share)
    end
end
