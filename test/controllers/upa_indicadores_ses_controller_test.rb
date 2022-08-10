require "test_helper"

class UpaIndicadoresSesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upa_indicadores_se = upa_indicadores_ses(:one)
  end

  test "should get index" do
    get upa_indicadores_ses_url
    assert_response :success
  end

  test "should get new" do
    get new_upa_indicadores_se_url
    assert_response :success
  end

  test "should create upa_indicadores_se" do
    assert_difference("UpaIndicadoresSe.count") do
      post upa_indicadores_ses_url, params: { upa_indicadores_se: { codigo: @upa_indicadores_se.codigo, descricao: @upa_indicadores_se.descricao, indicador: @upa_indicadores_se.indicador, medida: @upa_indicadores_se.medida, meta: @upa_indicadores_se.meta, status: @upa_indicadores_se.status, variavel: @upa_indicadores_se.variavel } }
    end

    assert_redirected_to upa_indicadores_se_url(UpaIndicadoresSe.last)
  end

  test "should show upa_indicadores_se" do
    get upa_indicadores_se_url(@upa_indicadores_se)
    assert_response :success
  end

  test "should get edit" do
    get edit_upa_indicadores_se_url(@upa_indicadores_se)
    assert_response :success
  end

  test "should update upa_indicadores_se" do
    patch upa_indicadores_se_url(@upa_indicadores_se), params: { upa_indicadores_se: { codigo: @upa_indicadores_se.codigo, descricao: @upa_indicadores_se.descricao, indicador: @upa_indicadores_se.indicador, medida: @upa_indicadores_se.medida, meta: @upa_indicadores_se.meta, status: @upa_indicadores_se.status, variavel: @upa_indicadores_se.variavel } }
    assert_redirected_to upa_indicadores_se_url(@upa_indicadores_se)
  end

  test "should destroy upa_indicadores_se" do
    assert_difference("UpaIndicadoresSe.count", -1) do
      delete upa_indicadores_se_url(@upa_indicadores_se)
    end

    assert_redirected_to upa_indicadores_ses_url
  end
end
