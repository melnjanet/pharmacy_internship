class AtcCodesController < ApplicationController
  before_action :set_atc_code, only: %i[ show edit update destroy ]

  # GET /atc_codes or /atc_codes.json
  def index
    @atc_codes = AtcCode.all
  end

  # GET /atc_codes/1 or /atc_codes/1.json
  def show
  end

  # GET /atc_codes/new
  def new
    @atc_code = AtcCode.new
  end

  # GET /atc_codes/1/edit
  def edit
  end

  # POST /atc_codes or /atc_codes.json
  def create
    @atc_code = AtcCode.new(atc_code_params)

    respond_to do |format|
      if @atc_code.save
        format.html { redirect_to atc_code_url(@atc_code), notice: "AtcCode was successfully created." }
        format.json { render :show, status: :created, location: @atc_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atc_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atc_codes/1 or /atc_codes/1.json
  def update
    respond_to do |format|
      if @atc_code.update(atc_code_params)
        format.html { redirect_to atc_code_url(@atc_code), notice: "AtcCode was successfully updated." }
        format.json { render :show, status: :ok, location: @atc_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atc_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atc_codes/1 or /atc_codes/1.json
  def destroy
    @atc_code.destroy

    respond_to do |format|
      format.html { redirect_to atc_codes_url, notice: "AtcCode was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_atc_code
    @atc_code = AtcCode.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def atc_code_params
    params.require(:atc_code).permit(:code, :title)
  end
end
