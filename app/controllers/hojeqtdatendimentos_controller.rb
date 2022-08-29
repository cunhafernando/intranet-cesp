class HojeqtdatendimentosController < ApplicationController
  before_action :set_hojeqtdatendimento, only: %i[ show edit update destroy ]

  # GET /hojeqtdatendimentos or /hojeqtdatendimentos.json
  def index
    @hojeqtdatendimentos = Hojeqtdatendimento.all
  end

  def remove_all
    Hojeqtdatendimento.delete_all
    flash[:warn] = "Lista removida com sucesso"
    redirect_to new_hojeqtdatendimento_path
  end

  def import_hojeqtdatendimentos
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        Hojeqtdatendimento.create(ano_mes: spreadsheet.row(i)[0], registrados: spreadsheet.row(i)[1], classificados: spreadsheet.row(i)[2], atendidos: spreadsheet.row(i)[3], acolhidos: spreadsheet.row(i)[4], tm_atendimento: spreadsheet.row(i)[5], tm_verde: spreadsheet.row(i)[6], verde_meta: spreadsheet.row(i)[7], verde_fora_meta: spreadsheet.row(i)[8], tm_amarelo: spreadsheet.row(i)[9], amarelo_meta: spreadsheet.row(i)[10], amarelo_fora_meta: spreadsheet.row(i)[11], vermelho_meta: spreadsheet.row(i)[12], vermelho_fora_meta: spreadsheet.row(i)[13])
      end
      flash[:success] = "Lista Importada"
      redirect_to new_hojeqtdatendimento_path 
    rescue Exception => e
      flash[:error] = "Problemas com seu arquivo"
      redirect_to new_hojeqtdatendimento_path 
    end
  end

  # GET /hojeqtdatendimentos/1 or /hojeqtdatendimentos/1.json
  def show
  end

  # GET /hojeqtdatendimentos/new
  def new
    @hojeqtdatendimentos = Hojeqtdatendimento.all
  end

  # GET /hojeqtdatendimentos/1/edit
  def edit
  end

  # POST /hojeqtdatendimentos or /hojeqtdatendimentos.json
  def create
    @hojeqtdatendimento = Hojeqtdatendimento.new(hojeqtdatendimento_params)

    respond_to do |format|
      if @hojeqtdatendimento.save
        format.html { redirect_to hojeqtdatendimento_url(@hojeqtdatendimento), notice: "Hojeqtdatendimento was successfully created." }
        format.json { render :show, status: :created, location: @hojeqtdatendimento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hojeqtdatendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hojeqtdatendimentos/1 or /hojeqtdatendimentos/1.json
  def update
    respond_to do |format|
      if @hojeqtdatendimento.update(hojeqtdatendimento_params)
        format.html { redirect_to hojeqtdatendimento_url(@hojeqtdatendimento), notice: "Hojeqtdatendimento was successfully updated." }
        format.json { render :show, status: :ok, location: @hojeqtdatendimento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hojeqtdatendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hojeqtdatendimentos/1 or /hojeqtdatendimentos/1.json
  def destroy
    @hojeqtdatendimento.destroy

    respond_to do |format|
      format.html { redirect_to hojeqtdatendimentos_url, notice: "Hojeqtdatendimento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hojeqtdatendimento
      @hojeqtdatendimento = Hojeqtdatendimento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hojeqtdatendimento_params
      params.require(:hojeqtdatendimento).permit(:ano_mes, :registrados, :classificados, :atendidos, :acolhidos, :tm_atendimento, :tm_verde, :verde_meta, :verde_fora_meta, :tm_amarelo, :amarelo_meta, :amarelo_fora_meta, :vermelho_meta, :vermelho_fora_meta)
    end
end
