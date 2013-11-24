class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  # GET /applications.csv
  def index
    if params[:customer_id]
        @customer = Customer.find(params[:customer_id])
        #this returns an array
        @applications = Application.find_by_sql("select * from applications where customer_id = " + params[:customer_id].to_s)
    else
        #this returns a relation class
        @applications = Application.all
    end

    respond_to do |format|
        format.html
        # from http://railscasts.com/episodes/362-exporting-csv-and-excel?view=asciicast
        format.csv { render text: to_csv(@applications) }
        # format.csv { send_data @applications.to_csv }
    end

  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render action: 'show', status: :created, location: @application }
      else
        format.html { render action: 'new' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
      if params[:customer_id]
          @customer = Customer.find(params[:customer_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:customer_id, :name, :servers, :tiers, :style, :provider, :customization, :consumer, :consumption, :transport, :integration, :inhouse, :contracted, :criticality, :sensitivity, :regulatory, :constraint, :bucket, :phase, :solution)
    end

    def to_csv(apps)
        CSV.generate do |csv|
            csv << Application.column_names
            apps.each do |app|
                csv << app.attributes.values_at(*Application.column_names)
            end
        end
    end

end
