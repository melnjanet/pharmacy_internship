class NomenclaturesController < ApplicationController
  before_action :set_nomenclature, only: %i[ show edit update destroy ]

  # GET /nomenclatures or /nomenclatures.json
  def index
    @nomenclatures = Nomenclature.all
  end

  # GET /nomenclatures/1 or /nomenclatures/1.json
  def show
  end

  # GET /nomenclatures/new
  def new
    @nomenclature = Nomenclature.new
  end

  # GET /nomenclatures/1/edit
  def edit
  end

  # POST /nomenclatures or /nomenclatures.json
  def create
    @nomenclature = Nomenclature.new(nomenclature_params)

    respond_to do |format|
      if @nomenclature.save
        format.html { redirect_to nomenclature_url(@nomenclature), notice: "Nomenclature was successfully created." }
        format.json { render :show, status: :created, location: @nomenclature }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nomenclature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nomenclatures/1 or /nomenclatures/1.json
  def update
    respond_to do |format|
      if @nomenclature.update(nomenclature_params)
        format.html { redirect_to nomenclature_url(@nomenclature), notice: "Nomenclature was successfully updated." }
        format.json { render :show, status: :ok, location: @nomenclature }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nomenclature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nomenclatures/1 or /nomenclatures/1.json
  def destroy
    @nomenclature.destroy

    respond_to do |format|
      format.html { redirect_to nomenclatures_url, notice: "Nomenclature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_nomenclature
    @nomenclature = Nomenclature.find(params[:id])
  end

  def nomenclature_params
    params.require(:nomenclature).permit(:brand_name, :age_group, :description, :dosage_form, :package_size,
                                         :package_units, :strength, :strength_units, :atc_code_id, :prescription,
                                         :country_id, :generic_name_id, :manufacture_id)
  end
end
