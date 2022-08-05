class ProductionBySpecialtiesController < ApplicationController
  before_action :set_production_by_specialty, only: %i[ show edit update destroy ]

  # GET /production_by_specialties or /production_by_specialties.json
  def index
    @production_by_specialties = ProductionBySpecialty.all
  end

  def remove_all
    ProductionBySpecialty.delete_all
    flash[:notice] = "Lista removida com sucesso"
    redirect_to production_by_specialties_path
  end

  def import_production_by_specialties
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        ProductionBySpecialty.create(specialty: spreadsheet.row(i)[0], foreseen: spreadsheet.row(i)[1], accomplished: spreadsheet.row(i)[2], performed_per_cent: spreadsheet.row(i)[3])
      end
      flash[:notice] = "Records Imported"
      redirect_to production_by_specialties_path 
    rescue Exception => e
      flash[:notice] = "Issues with file"
      redirect_to production_by_specialties_path 
    end
  end

  # GET /production_by_specialties/1 or /production_by_specialties/1.json
  def show
  end

  # GET /production_by_specialties/new
  def new
    @production_by_specialty = ProductionBySpecialty.new
  end

  # GET /production_by_specialties/1/edit
  def edit
  end

  # POST /production_by_specialties or /production_by_specialties.json
  def create
    @production_by_specialty = ProductionBySpecialty.new(production_by_specialty_params)

    respond_to do |format|
      if @production_by_specialty.save
        format.html { redirect_to production_by_specialty_url(@production_by_specialty), notice: "Production by specialty was successfully created." }
        format.json { render :show, status: :created, location: @production_by_specialty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @production_by_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_by_specialties/1 or /production_by_specialties/1.json
  def update
    respond_to do |format|
      if @production_by_specialty.update(production_by_specialty_params)
        format.html { redirect_to production_by_specialty_url(@production_by_specialty), notice: "Production by specialty was successfully updated." }
        format.json { render :show, status: :ok, location: @production_by_specialty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @production_by_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_by_specialties/1 or /production_by_specialties/1.json
  def destroy
    @production_by_specialty.destroy

    respond_to do |format|
      format.html { redirect_to production_by_specialties_url, notice: "Production by specialty was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_by_specialty
      @production_by_specialty = ProductionBySpecialty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def production_by_specialty_params
      params.require(:production_by_specialty).permit(:specialty, :foreseen, :accomplished, :performed_per_cent)
    end
end
