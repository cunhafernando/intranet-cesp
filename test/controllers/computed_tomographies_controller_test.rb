require "test_helper"

class ComputedTomographiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computed_tomography = computed_tomographies(:one)
  end

  test "should get index" do
    get computed_tomographies_url
    assert_response :success
  end

  test "should get new" do
    get new_computed_tomography_url
    assert_response :success
  end

  test "should create computed_tomography" do
    assert_difference("ComputedTomography.count") do
      post computed_tomographies_url, params: { computed_tomography: { amount: @computed_tomography.amount, date: @computed_tomography.date, exam: @computed_tomography.exam, number_of_reviews: @computed_tomography.number_of_reviews, procedure: @computed_tomography.procedure, release_date: @computed_tomography.release_date, released_by: @computed_tomography.released_by, requesting_section: @computed_tomography.requesting_section, sigtap_code: @computed_tomography.sigtap_code, value: @computed_tomography.value } }
    end

    assert_redirected_to computed_tomography_url(ComputedTomography.last)
  end

  test "should show computed_tomography" do
    get computed_tomography_url(@computed_tomography)
    assert_response :success
  end

  test "should get edit" do
    get edit_computed_tomography_url(@computed_tomography)
    assert_response :success
  end

  test "should update computed_tomography" do
    patch computed_tomography_url(@computed_tomography), params: { computed_tomography: { amount: @computed_tomography.amount, date: @computed_tomography.date, exam: @computed_tomography.exam, number_of_reviews: @computed_tomography.number_of_reviews, procedure: @computed_tomography.procedure, release_date: @computed_tomography.release_date, released_by: @computed_tomography.released_by, requesting_section: @computed_tomography.requesting_section, sigtap_code: @computed_tomography.sigtap_code, value: @computed_tomography.value } }
    assert_redirected_to computed_tomography_url(@computed_tomography)
  end

  test "should destroy computed_tomography" do
    assert_difference("ComputedTomography.count", -1) do
      delete computed_tomography_url(@computed_tomography)
    end

    assert_redirected_to computed_tomographies_url
  end
end
