require "apw"
require 'fusioncharts_helper'
include FusionChartsHelper 
require 'jqplotcharts_helper'
include JQPlotChartsHelper 

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  # GET /customers/:id/score
  def score
  
      def nvl(v)
          return v ? v : "UNKNOWN"
      end

      set_customer
      puts @customer
      applications = Application.find_by_sql("select * from applications where customer_id = " + @customer.id.to_s())
      @complexity_scores = {}
      @risk_scores = {}
      @assessments = {}
      applications.each { |a|
          @complexity_scores[a.name] =   complexityScores(a.servers.to_i, a.tiers.to_i, a.style, a.provider, a.customization, a.consumer, a.consumption, a.transport, a.integration, a.inhouse, a.contracted)
          @risk_scores[a.name] =  riskScores(a.criticality, a.sensitivity, a.regulatory, a.constraint)
          @assessments[a.name] = {'bucket' =>  nvl(a.bucket), 'phase' => nvl(a.phase), 'solution' => nvl(a.solution) }
      }
      puts @complexity_scores
      puts @risk_scores
      names_array = []
      bar_data = []
      @complexity_scores.each do |app_name, complexities|
          names_array << app_name
          bar_data << complexities['totallComplexity']
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name)
    end
end
