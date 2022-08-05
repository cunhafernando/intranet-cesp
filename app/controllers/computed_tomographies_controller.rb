class ComputedTomographiesController < ApplicationController
  before_action :set_computed_tomography, only: %i[ show edit update destroy ]

  # GET /computed_tomographies or /computed_tomographies.json
  def index
    @computed_tomographies = ComputedTomography.all
  end

  def remove_all
    ComputedTomography.delete_all
    flash[:notice] = "Lista removida com sucesso"
    redirect_to computed_tomographies_path
  end

  def import_computed_tomographies
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        ComputedTomography.create(date: spreadsheet.row(i)[0], exam: spreadsheet.row(i)[1], sigtap_code: spreadsheet.row(i)[2], released_by: spreadsheet.row(i)[3], release_date: spreadsheet.row(i)[4], requesting_section: spreadsheet.row(i)[5], amount: spreadsheet.row(i)[6], number_of_reviews: spreadsheet.row(i)[7], procedure: spreadsheet.row(i)[8], value: spreadsheet.row(i)[9])
      end
      flash[:notice] = "Records Imported"
      redirect_to computed_tomographies_path 
    rescue Exception => e
      flash[:notice] = "Issues with file"
      redirect_to computed_tomographies_path 
    end
  end

  # GET /computed_tomographies/1 or /computed_tomographies/1.json
  def show
    
  end

  # GET /computed_tomographies/new
  def new
    @computed_tomography = ComputedTomography.new
  end

  # GET /computed_tomographies/1/edit
  def edit
  end

  # POST /computed_tomographies or /computed_tomographies.json
  def create
    @computed_tomography = ComputedTomography.new(computed_tomography_params)

    respond_to do |format|
      if @computed_tomography.save
        format.html { redirect_to computed_tomography_url(@computed_tomography), notice: "Computed tomography was successfully created." }
        format.json { render :show, status: :created, location: @computed_tomography }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @computed_tomography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computed_tomographies/1 or /computed_tomographies/1.json
  def update
    respond_to do |format|
      if @computed_tomography.update(computed_tomography_params)
        format.html { redirect_to computed_tomography_url(@computed_tomography), notice: "Computed tomography was successfully updated." }
        format.json { render :show, status: :ok, location: @computed_tomography }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @computed_tomography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computed_tomographies/1 or /computed_tomographies/1.json
  def destroy
    @computed_tomography.destroy

    respond_to do |format|
      format.html { redirect_to computed_tomographies_url, notice: "Computed tomography was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computed_tomography
      @computed_tomography = ComputedTomography.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def computed_tomography_params
      params.require(:computed_tomography).permit(:date, :exam, :sigtap_code, :released_by, :release_date, :requesting_section, :amount, :number_of_reviews, :procedure, :value)
    end
end
