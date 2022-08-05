require "test_helper"

class ConsolidadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consolidado = consolidados(:one)
  end

  test "should get index" do
    get consolidados_url
    assert_response :success
  end

  test "should get new" do
    get new_consolidado_url
    assert_response :success
  end

  test "should create consolidado" do
    assert_difference("Consolidado.count") do
      post consolidados_url, params: { consolidado: { altas: @consolidado.altas, internados: @consolidado.internados, ir: @consolidado.ir, leitos: @consolidado.leitos, leitos_dia: @consolidado.leitos_dia, leitos_extra: @consolidado.leitos_extra, mpd: @consolidado.mpd, mpe: @consolidado.mpe, obito_maior: @consolidado.obito_maior, obito_menor: @consolidado.obito_menor, pacientes_dia: @consolidado.pacientes_dia, tmg: @consolidado.tmg, tmi: @consolidado.tmi, toch: @consolidado.toch, toco: @consolidado.toco, total_de_entradas: @consolidado.total_de_entradas, total_de_saidas: @consolidado.total_de_saidas, transf_externa: @consolidado.transf_externa } }
    end

    assert_redirected_to consolidado_url(Consolidado.last)
  end

  test "should show consolidado" do
    get consolidado_url(@consolidado)
    assert_response :success
  end

  test "should get edit" do
    get edit_consolidado_url(@consolidado)
    assert_response :success
  end

  test "should update consolidado" do
    patch consolidado_url(@consolidado), params: { consolidado: { altas: @consolidado.altas, internados: @consolidado.internados, ir: @consolidado.ir, leitos: @consolidado.leitos, leitos_dia: @consolidado.leitos_dia, leitos_extra: @consolidado.leitos_extra, mpd: @consolidado.mpd, mpe: @consolidado.mpe, obito_maior: @consolidado.obito_maior, obito_menor: @consolidado.obito_menor, pacientes_dia: @consolidado.pacientes_dia, tmg: @consolidado.tmg, tmi: @consolidado.tmi, toch: @consolidado.toch, toco: @consolidado.toco, total_de_entradas: @consolidado.total_de_entradas, total_de_saidas: @consolidado.total_de_saidas, transf_externa: @consolidado.transf_externa } }
    assert_redirected_to consolidado_url(@consolidado)
  end

  test "should destroy consolidado" do
    assert_difference("Consolidado.count", -1) do
      delete consolidado_url(@consolidado)
    end

    assert_redirected_to consolidados_url
  end
end
