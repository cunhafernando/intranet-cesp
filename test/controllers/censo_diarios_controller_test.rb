require "test_helper"

class CensoDiariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @censo_diario = censo_diarios(:one)
  end

  test "should get index" do
    get censo_diarios_url
    assert_response :success
  end

  test "should get new" do
    get new_censo_diario_url
    assert_response :success
  end

  test "should create censo_diario" do
    assert_difference("CensoDiario.count") do
      post censo_diarios_url, params: { censo_diario: { boletim: @censo_diario.boletim, convenio: @censo_diario.convenio, internacao: @censo_diario.internacao, leito: @censo_diario.leito, nascimento: @censo_diario.nascimento, paciente: @censo_diario.paciente, prontuario: @censo_diario.prontuario, pulseira: @censo_diario.pulseira, secao: @censo_diario.secao, sexo: @censo_diario.sexo } }
    end

    assert_redirected_to censo_diario_url(CensoDiario.last)
  end

  test "should show censo_diario" do
    get censo_diario_url(@censo_diario)
    assert_response :success
  end

  test "should get edit" do
    get edit_censo_diario_url(@censo_diario)
    assert_response :success
  end

  test "should update censo_diario" do
    patch censo_diario_url(@censo_diario), params: { censo_diario: { boletim: @censo_diario.boletim, convenio: @censo_diario.convenio, internacao: @censo_diario.internacao, leito: @censo_diario.leito, nascimento: @censo_diario.nascimento, paciente: @censo_diario.paciente, prontuario: @censo_diario.prontuario, pulseira: @censo_diario.pulseira, secao: @censo_diario.secao, sexo: @censo_diario.sexo } }
    assert_redirected_to censo_diario_url(@censo_diario)
  end

  test "should destroy censo_diario" do
    assert_difference("CensoDiario.count", -1) do
      delete censo_diario_url(@censo_diario)
    end

    assert_redirected_to censo_diarios_url
  end
end
