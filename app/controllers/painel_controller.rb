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
    @mpe_clinica_medica = (CensoSetor.where(secao: 'CLINICA MEDICA').sum(:mpe)).ceil(2)
    @color_mpe_clinica_medica = if @mpe_clinica_medica <= 7 
      "success" 
    else 
      "danger" 
    end
    @meta_mpe_clinica_medica =if @mpe_clinica_medica <= 7
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @clinica_cirurgica = (CensoSetor.where(secao: 'CLINICA CIRÚRGICA').sum(:mpe)).ceil(2)
    @mpe_clinica_pediatrica = (CensoSetor.where(secao: 'CLINICA PEDIATRICA').sum(:mpe)).ceil(2)
    @color_mpe_clinica_pediatrica = if @mpe_clinica_pediatrica <= 7 
      "success" 
    else 
      "danger" 
    end
    @meta_mpe_clinica_pediatrica =if @mpe_clinica_pediatrica <= 7
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @mpe_uti_ped = (CensoSetor.where(secao: 'UTI PED').sum(:mpe)).ceil(2)
    @color_mpe_uti_ped = if @mpe_uti_ped <= 7 
      "success" 
    else 
      "danger" 
    end
    @meta_mpe_uti_ped =if @mpe_uti_ped <= 7
      "Meta atingida"
    else
      "Meta não atingida"
    end
    
    
    @mpe_ctis = ((CensoSetor.where(secao: 'CTI 1').sum(:mpe) + CensoSetor.where(secao: 'CTI 2').sum(:mpe) + CensoSetor.where(secao: 'CTI 3').sum(:mpe) + CensoSetor.where(secao: 'CTI 4').sum(:mpe)) / 4).ceil(2)
    @color_mpe_ctis = if @mpe_ctis <= 7 
      "success" 
    else 
      "danger" 
    end
    @meta_mpe_ctis =if @mpe_ctis <= 7
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @cti_1 = ((CensoSetor.where(secao: 'CTI 1').sum(:pacientes_dia) / CensoSetor.where(secao: 'CTI 1').sum(:leitos_dia)) * 100).ceil(2)
    @color_cti_1 = if @cti_1 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_cti_1 =if @cti_1 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end
      
    @cti_2 = ((CensoSetor.where(secao: 'CTI 2').sum(:pacientes_dia) / CensoSetor.where(secao: 'CTI 2').sum(:leitos_dia)) * 100).ceil(2)
    @color_cti_2 = if @cti_2 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_cti_2 =if @cti_2 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @cti_3 = ((CensoSetor.where(secao: 'CTI 3').sum(:pacientes_dia) / CensoSetor.where(secao: 'CTI 3').sum(:leitos_dia)) * 100).ceil(2)
    @color_cti_3 = if @cti_3 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_cti_3 =if @cti_3 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @cti_4 = ((CensoSetor.where(secao: 'CTI 4').sum(:pacientes_dia) / CensoSetor.where(secao: 'CTI 4').sum(:leitos_dia)) * 100).ceil(2)
    @color_cti_4 = if @cti_4 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_cti_4 =if @cti_4 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @uti_ped = (CensoSetor.where(secao: 'UTI PED').sum(:pacientes_dia) / CensoSetor.where(secao: 'UTI PED').sum(:leitos_dia)) * 100
    @color_uti_ped = if @uti_ped >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_uti_ped =if @uti_ped >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end
      
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
    @meta_consolidado_perm =if @taxa_ocupacao_operacional >= 85
      "Meta Atingida"
    else
      "Abaixo da meta"
    end
    @color_consolidado_mpe = if @media_permanencia_geral <= 7
      "success" 
    else 
      "danger" 
    end
    @meta_consolidado_mpe =if @media_permanencia_geral <= 7
      "Meta Atingida"
    else
      "Abaixo da meta"
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
