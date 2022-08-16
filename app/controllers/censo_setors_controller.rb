class CensoSetorsController < ApplicationController
  before_action :set_censo_setor, only: %i[ show edit update destroy ]

  # GET /censo_setors or /censo_setors.json
  def index
    @censo_setors = CensoSetor.all
  end

  def remove_all
    CensoSetor.delete_all
    flash[:warn] = "Lista removida com sucesso"
    redirect_to new_censo_setor_path
  end

  def import_censo_setors
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (3..spreadsheet.last_row-1).each do |i|
        CensoSetor.create(secao: spreadsheet.row(i)[0], leitos: spreadsheet.row(i)[1], leitos_extra: spreadsheet.row(i)[2], leitos_dia: spreadsheet.row(i)[3], pacientes_dia: spreadsheet.row(i)[4], internados: spreadsheet.row(i)[5], transf_interna_entradas: spreadsheet.row(i)[6], total_de_entradas: spreadsheet.row(i)[7], altas: spreadsheet.row(i)[8], transf_externa: spreadsheet.row(i)[9], obito_maior: spreadsheet.row(i)[10], obito_menor: spreadsheet.row(i)[11], transf_interna_saida: spreadsheet.row(i)[12], total_de_saidas: spreadsheet.row(i)[13], mpd: spreadsheet.row(i)[14], toco: spreadsheet.row(i)[15], toch: spreadsheet.row(i)[16], mpe: spreadsheet.row(i)[17], tmg: spreadsheet.row(i)[18], tmi: spreadsheet.row(i)[19], ir: spreadsheet.row(i)[20])
      end
      flash[:success] = "Planilha importada com sucesso"
      redirect_to new_censo_setor_path 
    rescue Exception => e
      flash[:error] = "Problema com o arquivo"
      redirect_to new_censo_setor_path 
    end
  end

  # GET /censo_setors/1 or /censo_setors/1.json
  def show
  end

  # GET /censo_setors/new
  def new
    @censo_setors = CensoSetor.all
  end

  # GET /censo_setors/1/edit
  def edit
  end

  # POST /censo_setors or /censo_setors.json
  def create
    @censo_setor = CensoSetor.new(censo_setor_params)

    respond_to do |format|
      if @censo_setor.save
        format.html { redirect_to censo_setor_url(@censo_setor), notice: "Censo setor was successfully created." }
        format.json { render :show, status: :created, location: @censo_setor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @censo_setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /censo_setors/1 or /censo_setors/1.json
  def update
    respond_to do |format|
      if @censo_setor.update(censo_setor_params)
        format.html { redirect_to censo_setor_url(@censo_setor), notice: "Censo setor was successfully updated." }
        format.json { render :show, status: :ok, location: @censo_setor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @censo_setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /censo_setors/1 or /censo_setors/1.json
  def destroy
    @censo_setor.destroy

    respond_to do |format|
      format.html { redirect_to censo_setors_url, notice: "Censo setor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_censo_setor
      @censo_setor = CensoSetor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def censo_setor_params
      params.require(:censo_setor).permit(:secao, :leitos, :leitos_extra, :leitos_dia, :pacientes_dia, :internados, :transf_interna_entradas, :total_de_entradas, :altas, :transf_externa, :obito_maior, :obito_menor, :transf_interna_saida, :total_de_saidas, :mpd, :toco, :toch, :mpe, :tmg, :tmi, :ir)
    end
end
