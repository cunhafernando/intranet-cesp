class CensoDiariosController < ApplicationController
  before_action :set_censo_diario, only: %i[ show edit update destroy ]

  # GET /censo_diarios or /censo_diarios.json
  def index
    @censo_diarios = CensoDiario.all
  end

  def remove_all
    CensoDiario.delete_all
    flash[:warn] = "Lista removida com sucesso"
    redirect_to new_censo_diario_path
  end

  def import_censo_diarios
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        CensoDiario.create(secao: spreadsheet.row(i)[0], leito: spreadsheet.row(i)[1], boletim: spreadsheet.row(i)[2], pulseira: spreadsheet.row(i)[3], prontuario: spreadsheet.row(i)[4], paciente: spreadsheet.row(i)[5], sexo: spreadsheet.row(i)[6], nascimento: spreadsheet.row(i)[7], convenio: spreadsheet.row(i)[8], internacao: spreadsheet.row(i)[9])
      end
      flash[:success] = "Planilha importada com sucesso"
      redirect_to new_censo_diario_path 
    rescue Exception => e
      flash[:error] = "Problema com o arquivo"
      redirect_to new_censo_diario_path 
    end
  end

  # GET /censo_diarios/1 or /censo_diarios/1.json
  def show
  end

  # GET /censo_diarios/new
  def new
    @censo_diarios = CensoDiario.all
    @censo_diario = CensoDiario.new
  end

  # GET /censo_diarios/1/edit
  def edit
  end

  # POST /censo_diarios or /censo_diarios.json
  def create
    @censo_diario = CensoDiario.new(censo_diario_params)

    respond_to do |format|
      if @censo_diario.save
        format.html { redirect_to censo_diario_url(@censo_diario), notice: "Censo diario was successfully created." }
        format.json { render :show, status: :created, location: @censo_diario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @censo_diario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /censo_diarios/1 or /censo_diarios/1.json
  def update
    respond_to do |format|
      if @censo_diario.update(censo_diario_params)
        format.html { redirect_to censo_diario_url(@censo_diario), notice: "Censo diario was successfully updated." }
        format.json { render :show, status: :ok, location: @censo_diario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @censo_diario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /censo_diarios/1 or /censo_diarios/1.json
  def destroy
    @censo_diario.destroy

    respond_to do |format|
      format.html { redirect_to censo_diarios_url, notice: "Censo diario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_censo_diario
      @censo_diario = CensoDiario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def censo_diario_params
      params.require(:censo_diario).permit(:secao, :leito, :boletim, :pulseira, :prontuario, :paciente, :sexo, :nascimento, :convenio, :internacao)
    end
end
