require "application_system_test_case"

class ComputedTomographiesTest < ApplicationSystemTestCase
  setup do
    @computed_tomography = computed_tomographies(:one)
  end

  test "visiting the index" do
    visit computed_tomographies_url
    assert_selector "h1", text: "Computed tomographies"
  end

  test "should create computed tomography" do
    visit computed_tomographies_url
    click_on "New computed tomography"

    fill_in "Amount", with: @computed_tomography.amount
    fill_in "Date", with: @computed_tomography.date
    fill_in "Exam", with: @computed_tomography.exam
    fill_in "Number of reviews", with: @computed_tomography.number_of_reviews
    fill_in "Procedure", with: @computed_tomography.procedure
    fill_in "Release date", with: @computed_tomography.release_date
    fill_in "Released by", with: @computed_tomography.released_by
    fill_in "Requesting section", with: @computed_tomography.requesting_section
    fill_in "Sigtap code", with: @computed_tomography.sigtap_code
    fill_in "Value", with: @computed_tomography.value
    click_on "Create Computed tomography"

    assert_text "Computed tomography was successfully created"
    click_on "Back"
  end

  test "should update Computed tomography" do
    visit computed_tomography_url(@computed_tomography)
    click_on "Edit this computed tomography", match: :first

    fill_in "Amount", with: @computed_tomography.amount
    fill_in "Date", with: @computed_tomography.date
    fill_in "Exam", with: @computed_tomography.exam
    fill_in "Number of reviews", with: @computed_tomography.number_of_reviews
    fill_in "Procedure", with: @computed_tomography.procedure
    fill_in "Release date", with: @computed_tomography.release_date
    fill_in "Released by", with: @computed_tomography.released_by
    fill_in "Requesting section", with: @computed_tomography.requesting_section
    fill_in "Sigtap code", with: @computed_tomography.sigtap_code
    fill_in "Value", with: @computed_tomography.value
    click_on "Update Computed tomography"

    assert_text "Computed tomography was successfully updated"
    click_on "Back"
  end

  test "should destroy Computed tomography" do
    visit computed_tomography_url(@computed_tomography)
    click_on "Destroy this computed tomography", match: :first

    assert_text "Computed tomography was successfully destroyed"
  end
end
