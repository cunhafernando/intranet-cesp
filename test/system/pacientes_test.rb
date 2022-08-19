require "application_system_test_case"

class PacientesTest < ApplicationSystemTestCase
  setup do
    @paciente = pacientes(:one)
  end

  test "visiting the index" do
    visit pacientes_url
    assert_selector "h1", text: "Pacientes"
  end

  test "should create paciente" do
    visit pacientes_url
    click_on "New paciente"

    fill_in "Alta", with: @paciente.alta
    fill_in "Atendimento primeira", with: @paciente.atendimento_primeira
    fill_in "Bairro", with: @paciente.bairro
    fill_in "Boletim", with: @paciente.boletim
    fill_in "Classificacao", with: @paciente.classificacao
    fill_in "Cod diag", with: @paciente.cod_diag
    fill_in "Convenio", with: @paciente.convenio
    fill_in "Diagnostico", with: @paciente.diagnostico
    fill_in "Encaminhamento", with: @paciente.encaminhamento
    fill_in "Entrada", with: @paciente.entrada
    fill_in "Especialidade", with: @paciente.especialidade
    fill_in "Fim atendimento", with: @paciente.fim_atendimento
    fill_in "Idade", with: @paciente.idade
    fill_in "Inicio atendimento", with: @paciente.inicio_atendimento
    fill_in "Linha cuidado", with: @paciente.linha_cuidado
    fill_in "Meta", with: @paciente.meta
    fill_in "Motivo alta", with: @paciente.motivo_alta
    fill_in "Municipio", with: @paciente.municipio
    fill_in "Nome", with: @paciente.nome
    fill_in "Numero sisreg", with: @paciente.numero_sisreg
    fill_in "Profissional", with: @paciente.profissional
    fill_in "Raca", with: @paciente.raca
    fill_in "Risco", with: @paciente.risco
    fill_in "Sexo", with: @paciente.sexo
    fill_in "Tipo entrada", with: @paciente.tipo_entrada
    fill_in "Tipo problema", with: @paciente.tipo_problema
    fill_in "Tm atendimento", with: @paciente.tm_atendimento
    fill_in "Tm classxatend", with: @paciente.tm_classxatend
    fill_in "Tm cr", with: @paciente.tm_cr
    click_on "Create Paciente"

    assert_text "Paciente was successfully created"
    click_on "Back"
  end

  test "should update Paciente" do
    visit paciente_url(@paciente)
    click_on "Edit this paciente", match: :first

    fill_in "Alta", with: @paciente.alta
    fill_in "Atendimento primeira", with: @paciente.atendimento_primeira
    fill_in "Bairro", with: @paciente.bairro
    fill_in "Boletim", with: @paciente.boletim
    fill_in "Classificacao", with: @paciente.classificacao
    fill_in "Cod diag", with: @paciente.cod_diag
    fill_in "Convenio", with: @paciente.convenio
    fill_in "Diagnostico", with: @paciente.diagnostico
    fill_in "Encaminhamento", with: @paciente.encaminhamento
    fill_in "Entrada", with: @paciente.entrada
    fill_in "Especialidade", with: @paciente.especialidade
    fill_in "Fim atendimento", with: @paciente.fim_atendimento
    fill_in "Idade", with: @paciente.idade
    fill_in "Inicio atendimento", with: @paciente.inicio_atendimento
    fill_in "Linha cuidado", with: @paciente.linha_cuidado
    fill_in "Meta", with: @paciente.meta
    fill_in "Motivo alta", with: @paciente.motivo_alta
    fill_in "Municipio", with: @paciente.municipio
    fill_in "Nome", with: @paciente.nome
    fill_in "Numero sisreg", with: @paciente.numero_sisreg
    fill_in "Profissional", with: @paciente.profissional
    fill_in "Raca", with: @paciente.raca
    fill_in "Risco", with: @paciente.risco
    fill_in "Sexo", with: @paciente.sexo
    fill_in "Tipo entrada", with: @paciente.tipo_entrada
    fill_in "Tipo problema", with: @paciente.tipo_problema
    fill_in "Tm atendimento", with: @paciente.tm_atendimento
    fill_in "Tm classxatend", with: @paciente.tm_classxatend
    fill_in "Tm cr", with: @paciente.tm_cr
    click_on "Update Paciente"

    assert_text "Paciente was successfully updated"
    click_on "Back"
  end

  test "should destroy Paciente" do
    visit paciente_url(@paciente)
    click_on "Destroy this paciente", match: :first

    assert_text "Paciente was successfully destroyed"
  end
end
