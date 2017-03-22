class PropertyNamesController < ApplicationController
  before_action :set_property_name, only: [:show, :edit, :update, :destroy]

  # GET /property_names
  # GET /property_names.json
  def index
    @property_names = PropertyName.all
  end

  # GET /property_names/1
  # GET /property_names/1.json
  def show
  end

  # GET /property_names/new
  def new
    @property_name = PropertyName.new
  end

  # GET /property_names/1/edit
  def edit
  end

  # POST /property_names
  # POST /property_names.json
  def create
    @property_name = PropertyName.new(property_name_params)

    respond_to do |format|
      if @property_name.save
        format.html { redirect_to @property_name, notice: 'Property name was successfully created.' }
        format.json { render :show, status: :created, location: @property_name }
      else
        format.html { render :new }
        format.json { render json: @property_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_names/1
  # PATCH/PUT /property_names/1.json
  def update
    respond_to do |format|
      if @property_name.update(property_name_params)
        format.html { redirect_to @property_name, notice: 'Property name was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_name }
      else
        format.html { render :edit }
        format.json { render json: @property_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_names/1
  # DELETE /property_names/1.json
  def destroy
    @property_name.destroy
    respond_to do |format|
      format.html { redirect_to property_names_url, notice: 'Property name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_name
      @property_name = PropertyName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_name_params
      params.require(:property_name).permit(:name,:lease_terms)
    end
end
