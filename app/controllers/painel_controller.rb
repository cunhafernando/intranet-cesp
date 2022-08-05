class PainelController < ApplicationController
  before_action :production_by_specialties
  before_action :computed_tomographies
  before_action :amount_of_upa_services
  before_action :consolidados
  before_action :censo_setors

  def production_by_specialties
    @production_by_specialties = ProductionBySpecialty.all    
  end

  def censo_setors
    @censo_setors = CensoSetor.all
  end

  def consolidados
    @consolidados = Consolidado.all
    @taxa_mortalidade_institucional = ((Consolidado.all.sum(:obito_maior) / Consolidado.all.sum(:total_de_saidas)) * 100).ceil(2)
    @taxa_ocupacao_operacional = ((Consolidado.all.sum(:pacientes_dia) / Consolidado.all.sum(:leitos_dia)) * 100)
    @media_permanencia_geral = (Consolidado.all.sum(:pacientes_dia) / Consolidado.all.sum(:total_de_saidas))
    @diferenca_da_meta = 85 - @taxa_ocupacao_operacional
    @color_consolidado_tmi = if @taxa_mortalidade_institucional <= 10 
      "success" 
    else 
      "danger" 
    end
    @color_consolidado_perm = if @taxa_ocupacao_operacional >= 85
      "success" 
    else 
      "danger" 
    end
    @color_consolidado_mpe = if @media_permanencia_geral <= 7
      "success" 
    else 
      "danger" 
    end
  end

  def computed_tomographies
    @computed_tomographies = ComputedTomography.all
    @total_tomografia = ComputedTomography.all.sum(:amount)
    @media_tomografia = (((((@total_tomografia.to_f) / 2400) * 100).to_i) - 100)
    @color_media_tomografia = if @media_tomografia >= 0 
      "success" 
    else 
      "danger" 
    end
    @text_media_tomografia = if @media_tomografia >= 0 
      "acima" 
    else 
      "abaixo" 
    end
  end

  def amount_of_upa_services
    @amount_of_upa_services = AmountOfUpaService.all
    @total_atendimento = AmountOfUpaService.all.sum(:attended).to_i
    @media_atendimento = ((((@total_atendimento.to_f) / 6400) * 100).to_i) - 100
    @color_media_atendimento = if @media_atendimento >= 0 
      "success" 
    else 
      "danger" 
    end
    @text_media_atendimento = if @media_atendimento >= 0 
      "acima da média prevista" 
    else 
      "abaixo da média prevista" 
    end
    
  end
  
  def index
    
  end

  def show
  end
end
