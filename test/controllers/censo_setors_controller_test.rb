require "test_helper"

class CensoSetorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @censo_setor = censo_setors(:one)
  end

  test "should get index" do
    get censo_setors_url
    assert_response :success
  end

  test "should get new" do
    get new_censo_setor_url
    assert_response :success
  end

  test "should create censo_setor" do
    assert_difference("CensoSetor.count") do
      post censo_setors_url, params: { censo_setor: { altas: @censo_setor.altas, internados: @censo_setor.internados, ir: @censo_setor.ir, leitos: @censo_setor.leitos, leitos_dia: @censo_setor.leitos_dia, leitos_extra: @censo_setor.leitos_extra, mpd: @censo_setor.mpd, mpe: @censo_setor.mpe, obito_maior: @censo_setor.obito_maior, obito_menor: @censo_setor.obito_menor, pacientes_dia: @censo_setor.pacientes_dia, secao: @censo_setor.secao, tmg: @censo_setor.tmg, tmi: @censo_setor.tmi, toch: @censo_setor.toch, toco: @censo_setor.toco, total_de_entradas: @censo_setor.total_de_entradas, total_de_saidas: @censo_setor.total_de_saidas, transf_externa: @censo_setor.transf_externa, transf_interna_entradas: @censo_setor.transf_interna_entradas, transf_interna_saida: @censo_setor.transf_interna_saida } }
    end

    assert_redirected_to censo_setor_url(CensoSetor.last)
  end

  test "should show censo_setor" do
    get censo_setor_url(@censo_setor)
    assert_response :success
  end

  test "should get edit" do
    get edit_censo_setor_url(@censo_setor)
    assert_response :success
  end

  test "should update censo_setor" do
    patch censo_setor_url(@censo_setor), params: { censo_setor: { altas: @censo_setor.altas, internados: @censo_setor.internados, ir: @censo_setor.ir, leitos: @censo_setor.leitos, leitos_dia: @censo_setor.leitos_dia, leitos_extra: @censo_setor.leitos_extra, mpd: @censo_setor.mpd, mpe: @censo_setor.mpe, obito_maior: @censo_setor.obito_maior, obito_menor: @censo_setor.obito_menor, pacientes_dia: @censo_setor.pacientes_dia, secao: @censo_setor.secao, tmg: @censo_setor.tmg, tmi: @censo_setor.tmi, toch: @censo_setor.toch, toco: @censo_setor.toco, total_de_entradas: @censo_setor.total_de_entradas, total_de_saidas: @censo_setor.total_de_saidas, transf_externa: @censo_setor.transf_externa, transf_interna_entradas: @censo_setor.transf_interna_entradas, transf_interna_saida: @censo_setor.transf_interna_saida } }
    assert_redirected_to censo_setor_url(@censo_setor)
  end

  test "should destroy censo_setor" do
    assert_difference("CensoSetor.count", -1) do
      delete censo_setor_url(@censo_setor)
    end

    assert_redirected_to censo_setors_url
  end
end
