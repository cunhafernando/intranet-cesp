class AmountOfUpaServicesController < ApplicationController
  before_action :set_amount_of_upa_service, only: %i[ show edit update destroy ]

  # GET /amount_of_upa_services or /amount_of_upa_services.json
  def index
    @amount_of_upa_services = AmountOfUpaService.all
  end

  def remove_all
    AmountOfUpaService.delete_all
    flash[:notice] = "Lista removida com sucesso"
    redirect_to amount_of_upa_services_path
  end

  def import_amount_of_upa_services
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        AmountOfUpaService.create(year_month: spreadsheet.row(i)[0], registered: spreadsheet.row(i)[1], classified: spreadsheet.row(i)[2], attended: spreadsheet.row(i)[3], welcomed: spreadsheet.row(i)[4], service_time: spreadsheet.row(i)[5], green_time: spreadsheet.row(i)[6], green_in_the_goal: spreadsheet.row(i)[7], green_off_target: spreadsheet.row(i)[8], yellow_time: spreadsheet.row(i)[9], yellow_in_the_goal: spreadsheet.row(i)[10], yellow_off_target: spreadsheet.row(i)[11], red_in_the_goal: spreadsheet.row(i)[12], red_off_target: spreadsheet.row(i)[13])
      end
      flash[:notice] = "Records Imported"
      redirect_to amount_of_upa_services_path 
    rescue Exception => e
      flash[:notice] = "Issues with file"
      redirect_to amount_of_upa_services_path 
    end
  end

  # GET /amount_of_upa_services/1 or /amount_of_upa_services/1.json
  def show
  end

  # GET /amount_of_upa_services/new
  def new
    @amount_of_upa_service = AmountOfUpaService.new
  end

  # GET /amount_of_upa_services/1/edit
  def edit
  end

  # POST /amount_of_upa_services or /amount_of_upa_services.json
  def create
    @amount_of_upa_service = AmountOfUpaService.new(amount_of_upa_service_params)

    respond_to do |format|
      if @amount_of_upa_service.save
        format.html { redirect_to amount_of_upa_service_url(@amount_of_upa_service), notice: "Amount of upa service was successfully created." }
        format.json { render :show, status: :created, location: @amount_of_upa_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @amount_of_upa_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amount_of_upa_services/1 or /amount_of_upa_services/1.json
  def update
    respond_to do |format|
      if @amount_of_upa_service.update(amount_of_upa_service_params)
        format.html { redirect_to amount_of_upa_service_url(@amount_of_upa_service), notice: "Amount of upa service was successfully updated." }
        format.json { render :show, status: :ok, location: @amount_of_upa_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @amount_of_upa_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amount_of_upa_services/1 or /amount_of_upa_services/1.json
  def destroy
    @amount_of_upa_service.destroy

    respond_to do |format|
      format.html { redirect_to amount_of_upa_services_url, notice: "Amount of upa service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amount_of_upa_service
      @amount_of_upa_service = AmountOfUpaService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def amount_of_upa_service_params
      params.require(:amount_of_upa_service).permit(:year_month, :registered, :classified, :attended, :welcomed, :service_time, :green_time, :green_in_the_goal, :green_off_target, :yellow_time, :yellow_in_the_goal, :yellow_off_target, :red_in_the_goal, :red_off_target)
    end
end
