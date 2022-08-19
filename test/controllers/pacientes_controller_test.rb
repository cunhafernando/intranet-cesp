require "test_helper"

class PacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get pacientes_url
    assert_response :success
  end

  test "should get new" do
    get new_paciente_url
    assert_response :success
  end

  test "should create paciente" do
    assert_difference("Paciente.count") do
      post pacientes_url, params: { paciente: { alta: @paciente.alta, atendimento_primeira: @paciente.atendimento_primeira, bairro: @paciente.bairro, boletim: @paciente.boletim, classificacao: @paciente.classificacao, cod_diag: @paciente.cod_diag, convenio: @paciente.convenio, diagnostico: @paciente.diagnostico, encaminhamento: @paciente.encaminhamento, entrada: @paciente.entrada, especialidade: @paciente.especialidade, fim_atendimento: @paciente.fim_atendimento, idade: @paciente.idade, inicio_atendimento: @paciente.inicio_atendimento, linha_cuidado: @paciente.linha_cuidado, meta: @paciente.meta, motivo_alta: @paciente.motivo_alta, municipio: @paciente.municipio, nome: @paciente.nome, numero_sisreg: @paciente.numero_sisreg, profissional: @paciente.profissional, raca: @paciente.raca, risco: @paciente.risco, sexo: @paciente.sexo, tipo_entrada: @paciente.tipo_entrada, tipo_problema: @paciente.tipo_problema, tm_atendimento: @paciente.tm_atendimento, tm_classxatend: @paciente.tm_classxatend, tm_cr: @paciente.tm_cr } }
    end

    assert_redirected_to paciente_url(Paciente.last)
  end

  test "should show paciente" do
    get paciente_url(@paciente)
    assert_response :success
  end

  test "should get edit" do
    get edit_paciente_url(@paciente)
    assert_response :success
  end

  test "should update paciente" do
    patch paciente_url(@paciente), params: { paciente: { alta: @paciente.alta, atendimento_primeira: @paciente.atendimento_primeira, bairro: @paciente.bairro, boletim: @paciente.boletim, classificacao: @paciente.classificacao, cod_diag: @paciente.cod_diag, convenio: @paciente.convenio, diagnostico: @paciente.diagnostico, encaminhamento: @paciente.encaminhamento, entrada: @paciente.entrada, especialidade: @paciente.especialidade, fim_atendimento: @paciente.fim_atendimento, idade: @paciente.idade, inicio_atendimento: @paciente.inicio_atendimento, linha_cuidado: @paciente.linha_cuidado, meta: @paciente.meta, motivo_alta: @paciente.motivo_alta, municipio: @paciente.municipio, nome: @paciente.nome, numero_sisreg: @paciente.numero_sisreg, profissional: @paciente.profissional, raca: @paciente.raca, risco: @paciente.risco, sexo: @paciente.sexo, tipo_entrada: @paciente.tipo_entrada, tipo_problema: @paciente.tipo_problema, tm_atendimento: @paciente.tm_atendimento, tm_classxatend: @paciente.tm_classxatend, tm_cr: @paciente.tm_cr } }
    assert_redirected_to paciente_url(@paciente)
  end

  test "should destroy paciente" do
    assert_difference("Paciente.count", -1) do
      delete paciente_url(@paciente)
    end

    assert_redirected_to pacientes_url
  end
end
