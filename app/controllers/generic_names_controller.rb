class GenericNamesController < ApplicationController
  before_action :set_generic_name, only: %i[ show edit update destroy ]

  # GET /generic_names or /generic_names.json
  def index
    @generic_names = GenericName.all
  end

  # GET /generic_names/1 or /generic_names/1.json
  def show
  end

  # GET /generic_names/new
  def new
    @generic_name = GenericName.new
  end

  # GET /generic_names/1/edit
  def edit
  end

  # POST /generic_names or /generic_names.json
  def create
    @generic_name = GenericName.new(generic_name_params)

    respond_to do |format|
      if @generic_name.save
        format.html { redirect_to generic_name_url(@generic_name), notice: "Generic Name was successfully created." }
        format.json { render :show, status: :created, location: @generic_name }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @generic_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generic_names/1 or /generic_names/1.json
  def update
    respond_to do |format|
      if @generic_name.update(generic_name_params)
        format.html { redirect_to generic_name_url(@generic_name), notice: "Generic Name was successfully updated." }
        format.json { render :show, status: :ok, location: @generic_name }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @generic_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generic_names/1 or /generic_names/1.json
  def destroy
    @generic_name.destroy

    respond_to do |format|
      format.html { redirect_to generic_names_url, notice: "Generic Name was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_generic_name
    @generic_name = GenericName.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def generic_name_params
    params.require(:generic_name).permit( :title)
  end
end
