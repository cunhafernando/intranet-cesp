require "application_system_test_case"

class UpaIndicadoresSesTest < ApplicationSystemTestCase
  setup do
    @upa_indicadores_se = upa_indicadores_ses(:one)
  end

  test "visiting the index" do
    visit upa_indicadores_ses_url
    assert_selector "h1", text: "Upa indicadores ses"
  end

  test "should create upa indicadores se" do
    visit upa_indicadores_ses_url
    click_on "New upa indicadores se"

    fill_in "Codigo", with: @upa_indicadores_se.codigo
    fill_in "Descricao", with: @upa_indicadores_se.descricao
    fill_in "Indicador", with: @upa_indicadores_se.indicador
    fill_in "Medida", with: @upa_indicadores_se.medida
    fill_in "Meta", with: @upa_indicadores_se.meta
    fill_in "Status", with: @upa_indicadores_se.status
    fill_in "Variavel", with: @upa_indicadores_se.variavel
    click_on "Create Upa indicadores se"

    assert_text "Upa indicadores se was successfully created"
    click_on "Back"
  end

  test "should update Upa indicadores se" do
    visit upa_indicadores_se_url(@upa_indicadores_se)
    click_on "Edit this upa indicadores se", match: :first

    fill_in "Codigo", with: @upa_indicadores_se.codigo
    fill_in "Descricao", with: @upa_indicadores_se.descricao
    fill_in "Indicador", with: @upa_indicadores_se.indicador
    fill_in "Medida", with: @upa_indicadores_se.medida
    fill_in "Meta", with: @upa_indicadores_se.meta
    fill_in "Status", with: @upa_indicadores_se.status
    fill_in "Variavel", with: @upa_indicadores_se.variavel
    click_on "Update Upa indicadores se"

    assert_text "Upa indicadores se was successfully updated"
    click_on "Back"
  end

  test "should destroy Upa indicadores se" do
    visit upa_indicadores_se_url(@upa_indicadores_se)
    click_on "Destroy this upa indicadores se", match: :first

    assert_text "Upa indicadores se was successfully destroyed"
  end
end
