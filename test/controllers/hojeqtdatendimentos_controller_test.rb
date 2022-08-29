require "test_helper"

class HojeqtdatendimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hojeqtdatendimento = hojeqtdatendimentos(:one)
  end

  test "should get index" do
    get hojeqtdatendimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_hojeqtdatendimento_url
    assert_response :success
  end

  test "should create hojeqtdatendimento" do
    assert_difference("Hojeqtdatendimento.count") do
      post hojeqtdatendimentos_url, params: { hojeqtdatendimento: { acolhidos: @hojeqtdatendimento.acolhidos, amarelo_fora_meta: @hojeqtdatendimento.amarelo_fora_meta, amarelo_meta: @hojeqtdatendimento.amarelo_meta, ano_mes: @hojeqtdatendimento.ano_mes, atendidos: @hojeqtdatendimento.atendidos, classificados: @hojeqtdatendimento.classificados, registrados: @hojeqtdatendimento.registrados, tm_amarelo: @hojeqtdatendimento.tm_amarelo, tm_atendimento: @hojeqtdatendimento.tm_atendimento, tm_verde: @hojeqtdatendimento.tm_verde, verde_fora_meta: @hojeqtdatendimento.verde_fora_meta, verde_meta: @hojeqtdatendimento.verde_meta, vermelho_fora_meta: @hojeqtdatendimento.vermelho_fora_meta, vermelho_meta: @hojeqtdatendimento.vermelho_meta } }
    end

    assert_redirected_to hojeqtdatendimento_url(Hojeqtdatendimento.last)
  end

  test "should show hojeqtdatendimento" do
    get hojeqtdatendimento_url(@hojeqtdatendimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_hojeqtdatendimento_url(@hojeqtdatendimento)
    assert_response :success
  end

  test "should update hojeqtdatendimento" do
    patch hojeqtdatendimento_url(@hojeqtdatendimento), params: { hojeqtdatendimento: { acolhidos: @hojeqtdatendimento.acolhidos, amarelo_fora_meta: @hojeqtdatendimento.amarelo_fora_meta, amarelo_meta: @hojeqtdatendimento.amarelo_meta, ano_mes: @hojeqtdatendimento.ano_mes, atendidos: @hojeqtdatendimento.atendidos, classificados: @hojeqtdatendimento.classificados, registrados: @hojeqtdatendimento.registrados, tm_amarelo: @hojeqtdatendimento.tm_amarelo, tm_atendimento: @hojeqtdatendimento.tm_atendimento, tm_verde: @hojeqtdatendimento.tm_verde, verde_fora_meta: @hojeqtdatendimento.verde_fora_meta, verde_meta: @hojeqtdatendimento.verde_meta, vermelho_fora_meta: @hojeqtdatendimento.vermelho_fora_meta, vermelho_meta: @hojeqtdatendimento.vermelho_meta } }
    assert_redirected_to hojeqtdatendimento_url(@hojeqtdatendimento)
  end

  test "should destroy hojeqtdatendimento" do
    assert_difference("Hojeqtdatendimento.count", -1) do
      delete hojeqtdatendimento_url(@hojeqtdatendimento)
    end

    assert_redirected_to hojeqtdatendimentos_url
  end
end
