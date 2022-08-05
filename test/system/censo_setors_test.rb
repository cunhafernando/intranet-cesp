require "application_system_test_case"

class CensoSetorsTest < ApplicationSystemTestCase
  setup do
    @censo_setor = censo_setors(:one)
  end

  test "visiting the index" do
    visit censo_setors_url
    assert_selector "h1", text: "Censo setors"
  end

  test "should create censo setor" do
    visit censo_setors_url
    click_on "New censo setor"

    fill_in "Altas", with: @censo_setor.altas
    fill_in "Internados", with: @censo_setor.internados
    fill_in "Ir", with: @censo_setor.ir
    fill_in "Leitos", with: @censo_setor.leitos
    fill_in "Leitos dia", with: @censo_setor.leitos_dia
    fill_in "Leitos extra", with: @censo_setor.leitos_extra
    fill_in "Mpd", with: @censo_setor.mpd
    fill_in "Mpe", with: @censo_setor.mpe
    fill_in "Obito maior", with: @censo_setor.obito_maior
    fill_in "Obito menor", with: @censo_setor.obito_menor
    fill_in "Pacientes dia", with: @censo_setor.pacientes_dia
    fill_in "Secao", with: @censo_setor.secao
    fill_in "Tmg", with: @censo_setor.tmg
    fill_in "Tmi", with: @censo_setor.tmi
    fill_in "Toch", with: @censo_setor.toch
    fill_in "Toco", with: @censo_setor.toco
    fill_in "Total de entradas", with: @censo_setor.total_de_entradas
    fill_in "Total de saidas", with: @censo_setor.total_de_saidas
    fill_in "Transf externa", with: @censo_setor.transf_externa
    fill_in "Transf interna entradas", with: @censo_setor.transf_interna_entradas
    fill_in "Transf interna saida", with: @censo_setor.transf_interna_saida
    click_on "Create Censo setor"

    assert_text "Censo setor was successfully created"
    click_on "Back"
  end

  test "should update Censo setor" do
    visit censo_setor_url(@censo_setor)
    click_on "Edit this censo setor", match: :first

    fill_in "Altas", with: @censo_setor.altas
    fill_in "Internados", with: @censo_setor.internados
    fill_in "Ir", with: @censo_setor.ir
    fill_in "Leitos", with: @censo_setor.leitos
    fill_in "Leitos dia", with: @censo_setor.leitos_dia
    fill_in "Leitos extra", with: @censo_setor.leitos_extra
    fill_in "Mpd", with: @censo_setor.mpd
    fill_in "Mpe", with: @censo_setor.mpe
    fill_in "Obito maior", with: @censo_setor.obito_maior
    fill_in "Obito menor", with: @censo_setor.obito_menor
    fill_in "Pacientes dia", with: @censo_setor.pacientes_dia
    fill_in "Secao", with: @censo_setor.secao
    fill_in "Tmg", with: @censo_setor.tmg
    fill_in "Tmi", with: @censo_setor.tmi
    fill_in "Toch", with: @censo_setor.toch
    fill_in "Toco", with: @censo_setor.toco
    fill_in "Total de entradas", with: @censo_setor.total_de_entradas
    fill_in "Total de saidas", with: @censo_setor.total_de_saidas
    fill_in "Transf externa", with: @censo_setor.transf_externa
    fill_in "Transf interna entradas", with: @censo_setor.transf_interna_entradas
    fill_in "Transf interna saida", with: @censo_setor.transf_interna_saida
    click_on "Update Censo setor"

    assert_text "Censo setor was successfully updated"
    click_on "Back"
  end

  test "should destroy Censo setor" do
    visit censo_setor_url(@censo_setor)
    click_on "Destroy this censo setor", match: :first

    assert_text "Censo setor was successfully destroyed"
  end
end
