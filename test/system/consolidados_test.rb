require "application_system_test_case"

class ConsolidadosTest < ApplicationSystemTestCase
  setup do
    @consolidado = consolidados(:one)
  end

  test "visiting the index" do
    visit consolidados_url
    assert_selector "h1", text: "Consolidados"
  end

  test "should create consolidado" do
    visit consolidados_url
    click_on "New consolidado"

    fill_in "Altas", with: @consolidado.altas
    fill_in "Internados", with: @consolidado.internados
    fill_in "Ir", with: @consolidado.ir
    fill_in "Leitos", with: @consolidado.leitos
    fill_in "Leitos dia", with: @consolidado.leitos_dia
    fill_in "Leitos extra", with: @consolidado.leitos_extra
    fill_in "Mpd", with: @consolidado.mpd
    fill_in "Mpe", with: @consolidado.mpe
    fill_in "Obito maior", with: @consolidado.obito_maior
    fill_in "Obito menor", with: @consolidado.obito_menor
    fill_in "Pacientes dia", with: @consolidado.pacientes_dia
    fill_in "Tmg", with: @consolidado.tmg
    fill_in "Tmi", with: @consolidado.tmi
    fill_in "Toch", with: @consolidado.toch
    fill_in "Toco", with: @consolidado.toco
    fill_in "Total de entradas", with: @consolidado.total_de_entradas
    fill_in "Total de saidas", with: @consolidado.total_de_saidas
    fill_in "Transf externa", with: @consolidado.transf_externa
    click_on "Create Consolidado"

    assert_text "Consolidado was successfully created"
    click_on "Back"
  end

  test "should update Consolidado" do
    visit consolidado_url(@consolidado)
    click_on "Edit this consolidado", match: :first

    fill_in "Altas", with: @consolidado.altas
    fill_in "Internados", with: @consolidado.internados
    fill_in "Ir", with: @consolidado.ir
    fill_in "Leitos", with: @consolidado.leitos
    fill_in "Leitos dia", with: @consolidado.leitos_dia
    fill_in "Leitos extra", with: @consolidado.leitos_extra
    fill_in "Mpd", with: @consolidado.mpd
    fill_in "Mpe", with: @consolidado.mpe
    fill_in "Obito maior", with: @consolidado.obito_maior
    fill_in "Obito menor", with: @consolidado.obito_menor
    fill_in "Pacientes dia", with: @consolidado.pacientes_dia
    fill_in "Tmg", with: @consolidado.tmg
    fill_in "Tmi", with: @consolidado.tmi
    fill_in "Toch", with: @consolidado.toch
    fill_in "Toco", with: @consolidado.toco
    fill_in "Total de entradas", with: @consolidado.total_de_entradas
    fill_in "Total de saidas", with: @consolidado.total_de_saidas
    fill_in "Transf externa", with: @consolidado.transf_externa
    click_on "Update Consolidado"

    assert_text "Consolidado was successfully updated"
    click_on "Back"
  end

  test "should destroy Consolidado" do
    visit consolidado_url(@consolidado)
    click_on "Destroy this consolidado", match: :first

    assert_text "Consolidado was successfully destroyed"
  end
end
