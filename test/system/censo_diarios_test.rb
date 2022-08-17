require "application_system_test_case"

class CensoDiariosTest < ApplicationSystemTestCase
  setup do
    @censo_diario = censo_diarios(:one)
  end

  test "visiting the index" do
    visit censo_diarios_url
    assert_selector "h1", text: "Censo diarios"
  end

  test "should create censo diario" do
    visit censo_diarios_url
    click_on "New censo diario"

    fill_in "Boletim", with: @censo_diario.boletim
    fill_in "Convenio", with: @censo_diario.convenio
    fill_in "Internacao", with: @censo_diario.internacao
    fill_in "Leito", with: @censo_diario.leito
    fill_in "Nascimento", with: @censo_diario.nascimento
    fill_in "Paciente", with: @censo_diario.paciente
    fill_in "Prontuario", with: @censo_diario.prontuario
    fill_in "Pulseira", with: @censo_diario.pulseira
    fill_in "Secao", with: @censo_diario.secao
    fill_in "Sexo", with: @censo_diario.sexo
    click_on "Create Censo diario"

    assert_text "Censo diario was successfully created"
    click_on "Back"
  end

  test "should update Censo diario" do
    visit censo_diario_url(@censo_diario)
    click_on "Edit this censo diario", match: :first

    fill_in "Boletim", with: @censo_diario.boletim
    fill_in "Convenio", with: @censo_diario.convenio
    fill_in "Internacao", with: @censo_diario.internacao
    fill_in "Leito", with: @censo_diario.leito
    fill_in "Nascimento", with: @censo_diario.nascimento
    fill_in "Paciente", with: @censo_diario.paciente
    fill_in "Prontuario", with: @censo_diario.prontuario
    fill_in "Pulseira", with: @censo_diario.pulseira
    fill_in "Secao", with: @censo_diario.secao
    fill_in "Sexo", with: @censo_diario.sexo
    click_on "Update Censo diario"

    assert_text "Censo diario was successfully updated"
    click_on "Back"
  end

  test "should destroy Censo diario" do
    visit censo_diario_url(@censo_diario)
    click_on "Destroy this censo diario", match: :first

    assert_text "Censo diario was successfully destroyed"
  end
end
