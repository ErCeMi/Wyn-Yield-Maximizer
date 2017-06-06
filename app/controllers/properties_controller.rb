class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /properties
  # GET /properties.json
  def raw


    @buildings = Property.building_names


    @bed_premiums_per_building = {}

    PropertyName.all.each do |building_name|
      @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}) )
    end
    render :layout => false
  end

  def mbc
      @ten1112lineunits=["601-110","601-210","601-310","601-410","601-111","601-211","601-311","601-411","601-112","601-212","601-312","601-412","601-512"]
      @threemonthsoff = (1.0 - 0.167)
      @twomonthsoff = (1.0 - 0.118)
      @onemonthoff =  (1.0 - 0.0625)

      @twomonthsoff101112 =  (1.0 - 0.143)
      @onemonthoff101112 = (1.0 - 0.077)

      @mbc = PropertyName.find(15)
      @buildings = Property.building_names


      @bed_premiums_per_building = {}

      PropertyName.all.each do |building_name|
        @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}) )
      end
      render :layout => false
  end

  def rawren


    @buildings = Property.building_names


    @bed_premiums_per_building = {}

    PropertyName.all.each do |building_name|
      @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}) )
    end
    render :layout => false
  end

  def index
      @buildings = Property.building_names


      @bed_premiums_per_building = {}

      PropertyName.all.each do |building_name|
        @bed_premiums_per_building[building_name.name] = Property::PerBedPremium.new(building_name.name, (building_name.lease_terms.split(",").map{ |i| i.to_i}) )
      end
  end


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

    csv_text3 = File.read(params[:CSV].tempfile)
    csv3 = CSV.parse(csv_text3, :headers => true, :encoding => 'ISO-8859-1') #skip_blanks: true)#.reject { |row| row.all?(&:nil?) }



    csv3.each do |row|
      next if row.blank?
      t = Property.new
      t.lol3 = row['lol3']
      t.unit = row['unit']
      t.group = row['group']
      t.tenantid = row['tenantid']
      t.resident_name = row['resident_name']
      t.resident_rent = row['resident_rent']
      t.unit_rent = row['unit_rent']
      t.status = row['status']
      t.days_vacant = row['days_vacant']
      t.move_out = row['move_out'] ? Date.strptime(row['move_out'], '%m/%d/%y') : DateTime.now
      t.lease_to = row['lease_to'] ? Date.strptime(row['lease_to'], '%m/%d/%y') : nil
      t.amenities = row['amenities']
      t.amenities_amount = row['amenities_amount']
      t.discounts = row['discounts']
      t.company_id = row['company_id']
      t.unit_type_id = row['unit_type_id']
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
      params.require(:property).permit(:lol3, :unit, :group, :tenantid, :resident_name, :resident_rent, :unit_rent, :discount, :status, :days_vacant, :move_out, :lease_to, :amenities, :amenities_amount, :discounts, :company_id, :unit_type_id)
    end
end
