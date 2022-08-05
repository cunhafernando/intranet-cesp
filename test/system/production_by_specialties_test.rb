require "application_system_test_case"

class ProductionBySpecialtiesTest < ApplicationSystemTestCase
  setup do
    @production_by_specialty = production_by_specialties(:one)
  end

  test "visiting the index" do
    visit production_by_specialties_url
    assert_selector "h1", text: "Production by specialties"
  end

  test "should create production by specialty" do
    visit production_by_specialties_url
    click_on "New production by specialty"

    fill_in "Accomplished", with: @production_by_specialty.accomplished
    fill_in "Foreseen", with: @production_by_specialty.foreseen
    fill_in "Performed per cent", with: @production_by_specialty.performed_per_cent
    fill_in "Specialty", with: @production_by_specialty.specialty
    click_on "Create Production by specialty"

    assert_text "Production by specialty was successfully created"
    click_on "Back"
  end

  test "should update Production by specialty" do
    visit production_by_specialty_url(@production_by_specialty)
    click_on "Edit this production by specialty", match: :first

    fill_in "Accomplished", with: @production_by_specialty.accomplished
    fill_in "Foreseen", with: @production_by_specialty.foreseen
    fill_in "Performed per cent", with: @production_by_specialty.performed_per_cent
    fill_in "Specialty", with: @production_by_specialty.specialty
    click_on "Update Production by specialty"

    assert_text "Production by specialty was successfully updated"
    click_on "Back"
  end

  test "should destroy Production by specialty" do
    visit production_by_specialty_url(@production_by_specialty)
    click_on "Destroy this production by specialty", match: :first

    assert_text "Production by specialty was successfully destroyed"
  end
end
