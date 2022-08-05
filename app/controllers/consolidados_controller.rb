class ConsolidadosController < ApplicationController
  before_action :set_consolidado, only: %i[ show edit update destroy ]

  # GET /consolidados or /consolidados.json
  def index
    @consolidados = Consolidado.all
  end
  
  def remove_all
    Consolidado.delete_all
    flash[:notice] = "Lista removida com sucesso"
    redirect_to consolidados_path
  end

  def import_consolidados
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (3..spreadsheet.last_row-1).each do |i|
        Consolidado.create(leitos: spreadsheet.row(i)[0], leitos_extra: spreadsheet.row(i)[1], leitos_dia: spreadsheet.row(i)[2], pacientes_dia: spreadsheet.row(i)[3], internados: spreadsheet.row(i)[4], total_de_entradas: spreadsheet.row(i)[5], altas: spreadsheet.row(i)[6], transf_externa: spreadsheet.row(i)[7], obito_maior: spreadsheet.row(i)[8], obito_menor: spreadsheet.row(i)[9], total_de_saidas: spreadsheet.row(i)[10], mpd: spreadsheet.row(i)[11], toco: spreadsheet.row(i)[12], toch: spreadsheet.row(i)[13], mpe: spreadsheet.row(i)[14], tmg: spreadsheet.row(i)[15], tmi: spreadsheet.row(i)[16], ir: spreadsheet.row(i)[17])
      end
      flash[:notice] = "Records Imported"
      redirect_to consolidados_path 
    rescue Exception => e
      flash[:notice] = "Issues with file"
      redirect_to consolidados_path 
    end
  end

  # GET /consolidados/1 or /consolidados/1.json
  def show
  end

  # GET /consolidados/new
  def new
    @consolidado = Consolidado.new
  end

  # GET /consolidados/1/edit
  def edit
  end

  # POST /consolidados or /consolidados.json
  def create
    @consolidado = Consolidado.new(consolidado_params)

    respond_to do |format|
      if @consolidado.save
        format.html { redirect_to consolidado_url(@consolidado), notice: "Consolidado was successfully created." }
        format.json { render :show, status: :created, location: @consolidado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consolidado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consolidados/1 or /consolidados/1.json
  def update
    respond_to do |format|
      if @consolidado.update(consolidado_params)
        format.html { redirect_to consolidado_url(@consolidado), notice: "Consolidado was successfully updated." }
        format.json { render :show, status: :ok, location: @consolidado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consolidado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consolidados/1 or /consolidados/1.json
  def destroy
    @consolidado.destroy

    respond_to do |format|
      format.html { redirect_to consolidados_url, notice: "Consolidado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consolidado
      @consolidado = Consolidado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consolidado_params
      params.require(:consolidado).permit(:leitos, :leitos_extra, :leitos_dia, :pacientes_dia, :internados, :total_de_entradas, :altas, :transf_externa, :obito_maior, :obito_menor, :total_de_saidas, :mpd, :toco, :toch, :mpe, :tmg, :tmi, :ir)
    end
end
