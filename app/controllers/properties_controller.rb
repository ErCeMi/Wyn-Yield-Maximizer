class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    require 'date'

    @number_of_properties = Property.distinct.count('name')
    @unique_properties = Property.uniq.pluck(:name)
    @unique_bedrooms = [1,2,3]
    @vacant = Property.where(group: "Vacant Unrented")
    @notice = Property.where(group: "Notice Unrented")
    @available = @vacant + @notice
    @reportAvailable = @available.as_json(only: [:name, :unit, :unit_type, :days_vacant, :amenities, :group, :bedroom, :unit_rent])
    @number_of_leaseterms_offered = 6

    @months_array = [
    @t7months = 7.months.from_now.strftime("%m/%Y"),
    @t8months = 8.months.from_now.strftime("%m/%Y"),
    @t9months = 9.months.from_now.strftime("%m/%Y"),
    @t10months = 10.months.from_now.strftime("%m/%Y"),
    @t11months = 11.months.from_now.strftime("%m/%Y"),
    @t12months = 12.months.from_now.strftime("%m/%Y"),
    @t13months = 13.months.from_now.strftime("%m/%Y"),
    @t14months = 14.months.from_now.strftime("%m/%Y"),
    @t15months = 15.months.from_now.strftime("%m/%Y"),
    @t16months = 16.months.from_now.strftime("%m/%Y"),
    @t17months = 17.months.from_now.strftime("%m/%Y"),
    @t18months = 18.months.from_now.strftime("%m/%Y"),
    @t19months = 19.months.from_now.strftime("%m/%Y"),
    @t20months = 20.months.from_now.strftime("%m/%Y"),
    @t21months = 21.months.from_now.strftime("%m/%Y"),
    @t22months = 22.months.from_now.strftime("%m/%Y"),
    @t23months = 23.months.from_now.strftime("%m/%Y"),
    @t24months = 24.months.from_now.strftime("%m/%Y")]




    @array_of_rankings_per_bedroom_per_prop = []

    (@number_of_properties * 3).times do
      @array_of_rankings_per_bedroom_per_prop << [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

      end



    @all_units_for_ranking = []



    @unique_properties.each { |a| @unique_bedrooms.each { |b| @all_units_for_ranking << Property.where("name = ? AND bedroom = ?", a, b).as_json(only: [:name, :bedroom, :lease_to])}}



    @garbage = 0

    # end

    (0..(@all_units_for_ranking.length - 1)).each do |z|

      @all_units_for_ranking[z].each {|b| b["lease_to"] != nil ? (@months_array.each { |c| b["lease_to"].strftime("%m/%Y").to_s == c.to_s ?  (@array_of_rankings_per_bedroom_per_prop[z].map! {|x| x == @array_of_rankings_per_bedroom_per_prop[z][@months_array.index(c)] ? (@array_of_rankings_per_bedroom_per_prop[z][@months_array.index(c)] += 1) : x } ) : (@garbage += 1)  }): (@garbage += 1) }
    end

    @array_of_lease_terms_at_indeces = [7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    @array_of_lease_terms_to_display = [8,10,14,17,18,24]
    @array_of_indeces_for_ranking = []
    @array_of_lease_terms_to_display.each do |r|
        @array_of_indeces_for_ranking << @array_of_lease_terms_at_indeces.index(r)
     end



     @test = []
     @array_of_rankings_per_bedroom_per_prop.each do |z|
       @array_of_indeces_for_ranking.each do |a|
         @test << [z[a]]
     end
   end




      @test.each do |i|
        z = i.sort.uniq
        i.map! do |b|
          (z.index(b) + 1)
        end
      end


    @number_of_leaseterms_offered = @array_of_lease_terms_to_display.length

    # makes values equal to spread
    @array_of_rankings_per_bedroom_per_prop.each do |i|
      i.map! do |b|
        ((((b-1).to_f)/(@number_of_leaseterms_offered - 1)) * 50).round(0)
      end
    end



      @offerings = [["seven", 0], ["eight", 1], ["nine", 2], ["ten", 3],
          ["eleven", 4], ["twelve", 5], ["thirteen", 6], ["fourteen", 7],
           ["fifteen", 8], ["sixteen", 9], ["seventeen", 10], ["eighteen", 11],
            ["nineteen", 12], ["twenty", 13], ["twenty-one", 14],["twenty-two", 15],
             ["twenty-three", 16], ["twenty-four", 17]]



    @reportAvailable.each do |i|
      (0..(@number_of_properties - 1)).each do |p|
        if i["name"] == @unique_properties[p]
          if i["bedroom"] == 1
            @offerings.each do |a, b|
              i.merge!(a => (@array_of_rankings_per_bedroom_per_prop[(p * 3)][b] + i["unit_rent"]))
              end

          elsif i["bedroom"] == 2
            @offerings.each do |a, b|
                i.merge!(a => (@array_of_rankings_per_bedroom_per_prop[(p * 3 + 1)][b] + i["unit_rent"]))
              end

          elsif i["bedroom"] == 3
            @offerings.each do |a, b|
                i.merge!(a => (@array_of_rankings_per_bedroom_per_prop[(p * 3) +2 ][b] + i["unit_rent"]))
              end
          else
            @garbage += 1
          end
        else
          @garbage += 1
        end
      end
    end
  end

  def show
  end

  def report


       file = Tempfile.new('test')
    doc_text = Report.text(@property)
    Prawn::Document.generate(file) do
      text doc_text
    end
    send_file file, :type=>"application/pdf", :x_sendfile=>true
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
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :unit, :unit_type, :bedroom, :group, :tenantid, :resident_name, :resident_rent, :status, :days_vacant, :move_in, :move_out, :lease_from, :lease_to, :amenities, :company_id)
    end
end
