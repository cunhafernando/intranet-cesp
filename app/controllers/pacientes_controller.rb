class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[ show edit update destroy ]

  # GET /pacientes or /pacientes.json
  def index
    @pacientes = Paciente.all
  end

  def remove_all
    Paciente.delete_all
    flash[:warn] = "Lista removida com sucesso"
    redirect_to new_paciente_path
  end

  def import_pacientes
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        Paciente.create(risco: spreadsheet.row(i)[0], tipo_entrada: spreadsheet.row(i)[1], profissional: spreadsheet.row(i)[2], especialidade: spreadsheet.row(i)[3], linha_cuidado: spreadsheet.row(i)[4], boletim: spreadsheet.row(i)[5], entrada: spreadsheet.row(i)[6], classificacao: spreadsheet.row(i)[7], encaminhamento: spreadsheet.row(i)[8], atendimento_primeira: spreadsheet.row(i)[9], inicio_atendimento: spreadsheet.row(i)[10], fim_atendimento: spreadsheet.row(i)[11], alta: spreadsheet.row(i)[12], nome: spreadsheet.row(i)[13], idade: spreadsheet.row(i)[14], sexo: spreadsheet.row(i)[15], raca: spreadsheet.row(i)[16], tm_atendimento: spreadsheet.row(i)[17], tm_cr: spreadsheet.row(i)[18], tm_classxatend: spreadsheet.row(i)[19], meta: spreadsheet.row(i)[20], cod_diag: spreadsheet.row(i)[21], diagnostico: spreadsheet.row(i)[22], tipo_problema: spreadsheet.row(i)[23], motivo_alta: spreadsheet.row(i)[24], bairro: spreadsheet.row(i)[25], municipio: spreadsheet.row(i)[26], convenio: spreadsheet.row(i)[27], numero_sisreg: spreadsheet.row(i)[28])
      end
      flash[:success] = "Planilha importada com sucesso"
      redirect_to new_paciente_path 
    rescue Exception => e
      flash[:error] = "Problema com o arquivo"
      redirect_to new_paciente_path 
    end
  end

  # GET /pacientes/1 or /pacientes/1.json
  def show
  end

  # GET /pacientes/new
  def new
    @pacientes = Paciente.all
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes or /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully created." }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1 or /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully updated." }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1 or /pacientes/1.json
  def destroy
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: "Paciente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paciente_params
      params.require(:paciente).permit(:risco, :tipo_entrada, :profissional, :especialidade, :linha_cuidado, :boletim, :entrada, :classificacao, :encaminhamento, :atendimento_primeira, :inicio_atendimento, :fim_atendimento, :alta, :nome, :idade, :sexo, :raca, :tm_atendimento, :tm_cr, :tm_classxatend, :meta, :cod_diag, :diagnostico, :tipo_problema, :motivo_alta, :bairro, :municipio, :convenio, :numero_sisreg)
    end
end
