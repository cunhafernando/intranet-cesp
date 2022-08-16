class UpaIndicadoresSesController < ApplicationController
  before_action :set_upa_indicadores_se, only: %i[ show edit update destroy ]

  # GET /upa_indicadores_ses or /upa_indicadores_ses.json
  def index
    @upa_indicadores_ses = UpaIndicadoresSe.all
  end

  def remove_all
    UpaIndicadoresSe.delete_all
    flash[:warn] = "Lista removida com sucesso"
    redirect_to new_upa_indicadores_se_path
  end

  def import_upa_indicadores_ses
    file = params[:file]
    begin
      # Retreive the extension of the file
      file_ext = File.extname(file.original_filename)
      raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        UpaIndicadoresSe.create(codigo: spreadsheet.row(i)[0], indicador: spreadsheet.row(i)[1], meta: spreadsheet.row(i)[2], variavel: spreadsheet.row(i)[3], descricao: spreadsheet.row(i)[4], medida: spreadsheet.row(i)[5], status: spreadsheet.row(i)[6])
      end
      flash[:success] = "Lista Importada"
      redirect_to new_upa_indicadores_se_path 
    rescue Exception => e
      flash[:error] = "Problemas com seu arquivo"
      redirect_to new_upa_indicadores_se_path 
    end
  end

  # GET /upa_indicadores_ses/1 or /upa_indicadores_ses/1.json
  def show
  end

  # GET /upa_indicadores_ses/new
  def new
    @upa_indicadores_ses = UpaIndicadoresSe.all
  end

  # GET /upa_indicadores_ses/1/edit
  def edit
  end

  # POST /upa_indicadores_ses or /upa_indicadores_ses.json
  def create
    @upa_indicadores_se = UpaIndicadoresSe.new(upa_indicadores_se_params)

    respond_to do |format|
      if @upa_indicadores_se.save
        format.html { redirect_to upa_indicadores_se_url(@upa_indicadores_se), notice: "Upa indicadores se was successfully created." }
        format.json { render :show, status: :created, location: @upa_indicadores_se }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @upa_indicadores_se.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upa_indicadores_ses/1 or /upa_indicadores_ses/1.json
  def update
    respond_to do |format|
      if @upa_indicadores_se.update(upa_indicadores_se_params)
        format.html { redirect_to upa_indicadores_se_url(@upa_indicadores_se), notice: "Upa indicadores se was successfully updated." }
        format.json { render :show, status: :ok, location: @upa_indicadores_se }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @upa_indicadores_se.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upa_indicadores_ses/1 or /upa_indicadores_ses/1.json
  def destroy
    @upa_indicadores_se.destroy

    respond_to do |format|
      format.html { redirect_to upa_indicadores_ses_url, notice: "Upa indicadores se was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upa_indicadores_se
      @upa_indicadores_se = UpaIndicadoresSe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upa_indicadores_se_params
      params.require(:upa_indicadores_se).permit(:codigo, :indicador, :meta, :variavel, :descricao, :medida, :status)
    end
end
