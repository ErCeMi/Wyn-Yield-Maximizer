class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /properties
  # GET /properties.json
  def index
    @lease_terms = [7,10,11,12,13,14,15] # probably current_user.lease_terms
    # @available = Property.available

    # need a building model
    # building has_many properties
    # property belongs_to building
    @buildings = Property.building_names


    @bed_premiums_per_building = {}

    @buildings.each do |building_name|
      @bed_premiums_per_building[building_name] = Property::PerBedPremium.new(building_name, @lease_terms )
    end



    respond_to do |format|
      format.html
      format.csv { render text: Property.to_csv }
    end

    def renewal
      @lease_terms = [7,10,11,12,13,14,15] # probably current_user.lease_terms
      @available = Property.available
      @renewing = Property.renewing
      @premium = 1.015


      # need a building model
      # building has_many properties
      # property belongs_to building
      @buildings = Property.building_names


      @bed_premiums_per_building = {}

      @buildings.each do |building_name|
        @bed_premiums_per_building[building_name] = Property::PerBedPremium.new(building_name, @lease_terms )
      end

      respond_to do |format|
        format.html
        format.csv { render text: Property.to_csv }
      end
    end

  end

  # # inserted as an example of how to get an excel sheet
  # # as binary data
  # def get_exel_spread_sheet
  #   require 'httparty'
  #   columns = ['column1', 'column2', 'column3']
  #   collection = [
  #     {'column1' => 0, 'column2' => 1, 'column3' => 2},
  #     {'column1' => 0, 'column2' => 1, 'column3' => 2},
  #     {'column1' => 0, 'column2' => 1, 'column3' => 2},
  #   ]
  #   json_payload = {
  #       data: collection,
  #       headers: columns,
  #   }.to_json
  #   api_response = HTTParty.post("http://excel.zip.thruhere.net",
  #     {
  #       :body => {
  #         data: json_payload,
  #       }
  #     }
  #   )
  #   # this write file to disk
  #   # you will want to send the data as a response
  #   begin
  #     file = File.open("/tmp/sample.xls", "w")
  #     file.write(api_response.body)
  #   rescue IOError => e
  #     #some error occur, dir not writable etc.
  #     puts e
  #   ensure
  #     file.close unless file.nil?
  #   end
  # end




  def show
  end

  def report


  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:lol,:name, :unit, :unit_type, :bedroom, :group, :tenantid, :resident_name, :resident_rent, :unit_rent, :discount, :status, :days_vacant, :move_in, :move_out, :lease_from, :lease_to, :amenities, :company_id)
    end
end
