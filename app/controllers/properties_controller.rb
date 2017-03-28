class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /properties
  # GET /properties.json
  def raw

    # @lease_terms = [7,8,9,10,11,12] # probably current_user.lease_terms
    # @available = Property.available
    # render :layout => false

    # need a building model
    # building has_many properties
    # property belongs_to building
    @buildings = Property.building_names


    @bed_premiums_per_building = {}

    PropertyName.all.each do |building_name|
      @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}) )
    end
    render :layout => false
  end

  def rawren

    # @lease_terms = [7,8,9,10,11,12] # probably current_user.lease_terms
    # @available = Property.available
    # render :layout => false

    # need a building model
    # building has_many properties
    # property belongs_to building
    @buildings = Property.building_names


    @bed_premiums_per_building = {}

    PropertyName.all.each do |building_name|
      @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}) )
    end
    render :layout => false
  end

  def index
    # @lease_terms = [7,8,9,10,11,12] # probably current_user.lease_terms
    # @available = Property.available

    # need a building model
    # building has_many properties
    # property belongs_to building
    @buildings = Property.building_names
    # wattagattabitus = Property.joins(:unit_type).joins(:property_names)

    @bed_premiums_per_building = {}

    PropertyName.all.each do |building_name|
      @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}))
    end
  end

    def renewal
      # @lease_terms = [7,8,9,10,11,12] # probably current_user.lease_terms
      # @available = Property.available
      # @renewing = Property.renewing



      # need a building model
      # building has_many properties
      # property belongs_to building
      @buildings = Property.building_names


      @bed_premiums_per_building = {}

      PropertyName.all.each.each do |building_name|
        @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}))
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

  def update

  end

  def submit
    require 'csv'
    require 'open-uri'
    Property.destroy_all

    csv_text = File.read(params[:CSV].tempfile)
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1') #skip_blanks: true)#.reject { |row| row.all?(&:nil?) }

    csv.each do |row|
      next if row.blank?
      t = Property.new
      t.lol = row['lol']
      t.unit = row['unit']
      t.group = row['group']
      t.tenantid = row['tenantid']
      t.resident_name = row['resident_name']
      t.resident_rent = row['resident_rent']
      t.unit_rent = row['unit_rent']
      t.status = row['status']
      t.days_vacant = row['days_vacant']
      t.move_in = row['move_in'] ? Date.strptime(row['move_in'], '%m/%d/%y') : nil
      t.move_out = row['move_out'] ? Date.strptime(row['move_out'], '%m/%d/%y') : nil
      t.lease_from = row['lease_from'] ? Date.strptime(row['lease_from'], '%m/%d/%y') : nil
      t.lease_to = row['lease_to'] ? Date.strptime(row['lease_to'], '%m/%d/%y') : nil
      t.amenities = row['amenities']
      t.company_id = row['company_id']
      t.save!
    end

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
  # def update
  #   respond_to do |format|
  #     if @property.update(property_params)
  #       format.html { redirect_to @property, notice: 'Property was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @property }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @property.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
      params.require(:property).permit(:lol3, :unit, :group, :tenantid, :resident_name, :resident_rent, :unit_rent, :discount, :status, :days_vacant, :move_in, :move_out, :lease_from, :lease_to, :amenities, :discounts, :company_id, :unit_type_id)
    end
end
