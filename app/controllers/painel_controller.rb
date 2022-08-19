class PainelController < ApplicationController
  before_action :production_by_specialties
  before_action :computed_tomographies
  before_action :amount_of_upa_services
  before_action :consolidados
  before_action :censo_setors
  before_action :upa_indicadores_ses
  before_action :censo_diarios
  before_action :pacientes

  def censo_diarios
    @censo_diarios = CensoDiario.all
    @leitos_ocupados = ((CensoDiario.where.not(boletim:[nil, ""])).and(CensoDiario.where.not("leito LIKE ?", "%EXTRA%"))).count(:leito)
    @leitos_extras = CensoDiario.where("leito LIKE ?", "%EXTRA%").count(:leito)
    @leitos_extras_ocupados = ((CensoDiario.where.not(boletim:[nil, ""])).and(CensoDiario.where("leito LIKE ?", "%EXTRA%"))).count(:leito)
    @leitos_total = CensoDiario.where.not("leito LIKE ?", "%EXTRA%").count(:leito)
    @media_leitos_ocupados = @leitos_ocupados * 100 / @leitos_total
    @media_leitos_extras = @leitos_extras_ocupados * 100 / @leitos_extras
    @color_meta_leitos_ocupados = if @media_leitos_ocupados >= 85 
      "success" 
    else 
      "danger" 
    end
    @meta_leitos_ocupados =if @media_leitos_ocupados >= 85
      "Meta atingida"
    else
      "Meta não atingida"
    end
  end

  def pacientes
    @pacientes = Paciente.all
    @clinica_medica = (Paciente.where(especialidade: 'CLINICA MEDICA').count(:tipo_entrada))
    @cirurgia_geral = (Paciente.where(especialidade: 'CIRURGIA GERAL').count(:tipo_entrada))
    @cirurgia_vascular = (Paciente.where(especialidade: 'CIRURGIA VASCULAR').count(:tipo_entrada))
    @neuro_cirurgia = (Paciente.where(especialidade: 'NEUROCIRURGIA').count(:tipo_entrada))
    @ortopedia = (Paciente.where(especialidade: 'ORTOPEDIA').count(:tipo_entrada))
    @pediatria = (Paciente.where(especialidade: 'PEDIATRIA').count(:tipo_entrada))
    @comissao_curativos = (Paciente.where(especialidade: 'COMISSÃO DE CURATIVOS').count(:tipo_entrada))
    @bucomaxilofacial = (Paciente.where(especialidade: 'BUCOMAXILOFACIAL').count(:tipo_entrada))
    @pacientes_total = Paciente.all.count(:especialidade)
  end

  def upa_indicadores_ses
    @upa_indicadores_ses = UpaIndicadoresSe.all
    @d1 = ((((UpaIndicadoresSe.where(descricao: 'Numerador D1').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D1').pluck(:variavel)).to_sentence).to_f)).ceil(1)
    @color_d1 = if @d1 <= 30 
      "success" 
    else 
      "danger" 
    end
    @meta_d1 =if @d1 <= 30
      "Meta atingida"
    else
      "Meta não atingida"
    end
    
    @d2 = ((((UpaIndicadoresSe.where(descricao: 'Numerador D2').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D2').pluck(:variavel)).to_sentence).to_f)).ceil(1)
    @color_d2 = if @d2 <= 120 
      "success" 
    else 
      "danger" 
    end
    @meta_d2 =if @d2 <= 120
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d5 = ((((UpaIndicadoresSe.where(descricao: 'Numerador D5').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D5').pluck(:variavel)).to_sentence).to_f)).ceil(1)
    @color_d5 = if @d5 <= 15 
      "success" 
    else 
      "danger" 
    end
    @meta_d5 =if @d5 <= 15
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d6 = (((((UpaIndicadoresSe.where(descricao: 'Numerador D6').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D6').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_d6 = if @d6 <= 5 
      "success" 
    else 
      "danger" 
    end
    @meta_d6 =if @d6 <= 5
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d7 = (((((UpaIndicadoresSe.where(descricao: 'Numerador D7').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D7').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_d7 = if @d7 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_d7 =if @d7 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d8 = (((((UpaIndicadoresSe.where(descricao: 'Numerador D8').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D8').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_d8 = if @d8 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_d8 =if @d8 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d9 = (((((UpaIndicadoresSe.where(descricao: 'Numerador D9').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D9').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_d9 = if @d9 <= 3 
      "success" 
    else 
      "danger" 
    end
    @meta_d9 =if @d9 <= 3
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d10 = (((((UpaIndicadoresSe.where(descricao: 'Numerador D10').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D10').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_d10 = if @d10 <= 8 
      "success" 
    else 
      "danger" 
    end
    @meta_d10 =if @d10 <= 8
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d11 = (((((UpaIndicadoresSe.where(descricao: 'Numerador D11').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D11').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_d11 = if @d11 >= 100 
      "success" 
    else 
      "danger" 
    end
    @meta_d11 =if @d11 >= 100
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d12 = ((((UpaIndicadoresSe.where(descricao: 'Numerador D12').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D12').pluck(:variavel)).to_sentence).to_f)).ceil(1)
    @color_d12 = if @d12 <= 60 
      "success" 
    else 
      "danger" 
    end
    @meta_d12 =if @d12 <= 60
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d13 = ((((UpaIndicadoresSe.where(descricao: 'Numerador D13').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D13').pluck(:variavel)).to_sentence).to_f)).ceil(1)
    @color_d13 = if @d13 <= 30 
      "success" 
    else 
      "danger" 
    end
    @meta_d13 =if @d13 <= 30
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @d14 = (((((UpaIndicadoresSe.where(descricao: 'Numerador D14').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador D14').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_d14 = if @d14 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_d14 =if @d14 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @g1 = (((((UpaIndicadoresSe.where(descricao: 'Numerador G1').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador G1').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_g1 = if @g1 >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_g1 =if @g1 >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @g2 = (((((UpaIndicadoresSe.where(descricao: 'Numerador G2').pluck(:variavel)).to_sentence).to_f) / (((UpaIndicadoresSe.where(descricao: 'Denominador G2').pluck(:variavel)).to_sentence).to_f)) * 100).ceil(2)
    @color_g2 = if @g2 >= 80 
      "success" 
    else 
      "danger" 
    end
    @meta_g2 =if @g2 >= 80
      "Meta atingida"
    else
      "Meta não atingida"
    end
  end

  def production_by_specialties
    @production_by_specialties = ProductionBySpecialty.all    
  end

  def censo_setors
    @censo_setors = CensoSetor.all
    @mpe_ortopedia = (CensoSetor.where(secao: 'ORTOPEDIA').sum(:mpe)).ceil(2)
    @color_mpe_ortopedia = if @mpe_ortopedia <= 7 
      "success" 
    else 
      "danger" 
    end
    @meta_mpe_ortopedia =if @mpe_ortopedia <= 7
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @mpe_enfermaria_neuro = (CensoSetor.where(secao: 'ENFERMARIA NEURO').sum(:mpe)).ceil(2)
    @color_mpe_enfermaria_neuro = if @mpe_enfermaria_neuro <= 7 
      "success" 
    else 
      "danger" 
    end
    @meta_mpe_enfermaria_neuro =if @mpe_enfermaria_neuro <= 7
      "Meta atingida"
    else
      "Meta não atingida"
    end

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

    @mpe_clinica_cirurgica = (CensoSetor.where(secao: 'CLINICA CIRÚRGICA').sum(:mpe)).ceil(2)
    @color_mpe_clinica_cirurgica = if @mpe_clinica_cirurgica <= 7 
      "success" 
    else 
      "danger" 
    end
    @meta_mpe_clinica_cirurgica =if @mpe_clinica_cirurgica <= 7
      "Meta atingida"
    else
      "Meta não atingida"
    end

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

    # taxa de ocupação CTI1
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

    # taxa de ocupação CTI2
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

    # taxa de ocupação CTI3
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

    # taxa de ocupação CTI4
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

    # taxa de ocupação CTI's Geral
    @cti_geral_pacientes = CensoSetor.where(secao: 'CTI 1').sum(:pacientes_dia) + CensoSetor.where(secao: 'CTI 2').sum(:pacientes_dia) + CensoSetor.where(secao: 'CTI 3').sum(:pacientes_dia) + CensoSetor.where(secao: 'CTI 4').sum(:pacientes_dia)
    @cti_geral_leitos = CensoSetor.where(secao: 'CTI 1').sum(:leitos_dia) + CensoSetor.where(secao: 'CTI 2').sum(:leitos_dia) + CensoSetor.where(secao: 'CTI 3').sum(:leitos_dia) + CensoSetor.where(secao: 'CTI 4').sum(:leitos_dia)
    @cti_geral = ((@cti_geral_pacientes / @cti_geral_leitos) * 100).ceil(2)
    @color_cti_geral = if @cti_geral >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_cti_geral =if @cti_geral >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end
    
    # taxa de ocupação UTI PED
    @uti_ped = ((CensoSetor.where(secao: 'UTI PED').sum(:pacientes_dia) / CensoSetor.where(secao: 'UTI PED').sum(:leitos_dia)) * 100).ceil(2)
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

    # taxa de ocupação UPO
    @upo = ((CensoSetor.where(secao: 'UPO').sum(:pacientes_dia) / CensoSetor.where(secao: 'UPO').sum(:leitos_dia)) * 100).ceil(2)
    @color_upo = if @upo >= 90 
      "success" 
    else 
      "danger" 
    end
    @meta_upo =if @upo >= 90
      "Meta atingida"
    else
      "Meta não atingida"
    end
      
  end

  def consolidados
    @consolidados = Consolidado.all

    @taxa_mortalidade_institucional = ((Consolidado.all.sum(:obito_maior) / Consolidado.all.sum(:total_de_saidas)) * 100).ceil(2)
    @color_taxa_mortalidade_institucional = if @taxa_mortalidade_institucional <= 10 
      "success" 
    else 
      "danger" 
    end
    @meta_taxa_mortalidade_institucional =if @taxa_mortalidade_institucional <= 10
      "Meta atingida"
    else
      "Meta não atingida"
    end

    @qtd_internacoes = Consolidado.all.sum(:internados)

    @taxa_ocupacao_operacional = ((Consolidado.all.sum(:pacientes_dia) / Consolidado.all.sum(:leitos_dia)) * 100)
    @media_permanencia_geral = (Consolidado.all.sum(:pacientes_dia) / Consolidado.all.sum(:total_de_saidas))
    @diferenca_da_meta = 85 - @taxa_ocupacao_operacional
    @color_consolidado_perm = if @taxa_ocupacao_operacional >= 85
      "success" 
    else 
      "danger" 
    end
    @meta_consolidado_perm =if @taxa_ocupacao_operacional >= 85
      "Meta Atingida"
    else
      "Meta não atingida"
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
    @color_media_tomografia = if @media_tomografia >= 2400 
      "success" 
    else 
      "danger" 
    end
    @text_media_tomografia = if @media_tomografia >= 2400 
      "Meta atingida" 
    else 
      "Meta não atingida" 
    end
  end

  def amount_of_upa_services
    @amount_of_upa_services = AmountOfUpaService.all
    @total_atendimento = AmountOfUpaService.all.sum(:attended).to_i
    @media_atendimento = ((((@total_atendimento.to_f) / 6400) * 100).to_i) - 100
    @color_total_atendimento = if @total_atendimento >= 6400 
      "success" 
    else 
      "danger" 
    end
    @text_total_atendimento = if @total_atendimento >= 6400 
      "Meta atingida" 
    else 
      "Meta não atingida" 
    end
    
  end
  
  def index
    
  end

  def show
  end
end
