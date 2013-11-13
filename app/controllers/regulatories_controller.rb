class RegulatoriesController < ApplicationController
  before_action :set_regulatory, only: [:show, :edit, :update, :destroy]

  # GET /regulatories
  # GET /regulatories.json
  def index
    @regulatories = Regulatory.all
  end

  # GET /regulatories/1
  # GET /regulatories/1.json
  def show
  end

  # GET /regulatories/new
  def new
    @regulatory = Regulatory.new
  end

  # GET /regulatories/1/edit
  def edit
  end

  # POST /regulatories
  # POST /regulatories.json
  def create
    @regulatory = Regulatory.new(regulatory_params)

    respond_to do |format|
      if @regulatory.save
        format.html { redirect_to @regulatory, notice: 'Regulatory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @regulatory }
      else
        format.html { render action: 'new' }
        format.json { render json: @regulatory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regulatories/1
  # PATCH/PUT /regulatories/1.json
  def update
    respond_to do |format|
      if @regulatory.update(regulatory_params)
        format.html { redirect_to @regulatory, notice: 'Regulatory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @regulatory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regulatories/1
  # DELETE /regulatories/1.json
  def destroy
    @regulatory.destroy
    respond_to do |format|
      format.html { redirect_to regulatories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regulatory
      @regulatory = Regulatory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regulatory_params
      params.require(:regulatory).permit(:name, :share)
    end
end
