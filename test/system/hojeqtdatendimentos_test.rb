require "application_system_test_case"

class HojeqtdatendimentosTest < ApplicationSystemTestCase
  setup do
    @hojeqtdatendimento = hojeqtdatendimentos(:one)
  end

  test "visiting the index" do
    visit hojeqtdatendimentos_url
    assert_selector "h1", text: "Hojeqtdatendimentos"
  end

  test "should create hojeqtdatendimento" do
    visit hojeqtdatendimentos_url
    click_on "New hojeqtdatendimento"

    fill_in "Acolhidos", with: @hojeqtdatendimento.acolhidos
    fill_in "Amarelo fora meta", with: @hojeqtdatendimento.amarelo_fora_meta
    fill_in "Amarelo meta", with: @hojeqtdatendimento.amarelo_meta
    fill_in "Ano mes", with: @hojeqtdatendimento.ano_mes
    fill_in "Atendidos", with: @hojeqtdatendimento.atendidos
    fill_in "Classificados", with: @hojeqtdatendimento.classificados
    fill_in "Registrados", with: @hojeqtdatendimento.registrados
    fill_in "Tm amarelo", with: @hojeqtdatendimento.tm_amarelo
    fill_in "Tm atendimento", with: @hojeqtdatendimento.tm_atendimento
    fill_in "Tm verde", with: @hojeqtdatendimento.tm_verde
    fill_in "Verde fora meta", with: @hojeqtdatendimento.verde_fora_meta
    fill_in "Verde meta", with: @hojeqtdatendimento.verde_meta
    fill_in "Vermelho fora meta", with: @hojeqtdatendimento.vermelho_fora_meta
    fill_in "Vermelho meta", with: @hojeqtdatendimento.vermelho_meta
    click_on "Create Hojeqtdatendimento"

    assert_text "Hojeqtdatendimento was successfully created"
    click_on "Back"
  end

  test "should update Hojeqtdatendimento" do
    visit hojeqtdatendimento_url(@hojeqtdatendimento)
    click_on "Edit this hojeqtdatendimento", match: :first

    fill_in "Acolhidos", with: @hojeqtdatendimento.acolhidos
    fill_in "Amarelo fora meta", with: @hojeqtdatendimento.amarelo_fora_meta
    fill_in "Amarelo meta", with: @hojeqtdatendimento.amarelo_meta
    fill_in "Ano mes", with: @hojeqtdatendimento.ano_mes
    fill_in "Atendidos", with: @hojeqtdatendimento.atendidos
    fill_in "Classificados", with: @hojeqtdatendimento.classificados
    fill_in "Registrados", with: @hojeqtdatendimento.registrados
    fill_in "Tm amarelo", with: @hojeqtdatendimento.tm_amarelo
    fill_in "Tm atendimento", with: @hojeqtdatendimento.tm_atendimento
    fill_in "Tm verde", with: @hojeqtdatendimento.tm_verde
    fill_in "Verde fora meta", with: @hojeqtdatendimento.verde_fora_meta
    fill_in "Verde meta", with: @hojeqtdatendimento.verde_meta
    fill_in "Vermelho fora meta", with: @hojeqtdatendimento.vermelho_fora_meta
    fill_in "Vermelho meta", with: @hojeqtdatendimento.vermelho_meta
    click_on "Update Hojeqtdatendimento"

    assert_text "Hojeqtdatendimento was successfully updated"
    click_on "Back"
  end

  test "should destroy Hojeqtdatendimento" do
    visit hojeqtdatendimento_url(@hojeqtdatendimento)
    click_on "Destroy this hojeqtdatendimento", match: :first

    assert_text "Hojeqtdatendimento was successfully destroyed"
  end
end
