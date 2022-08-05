require "test_helper"

class ProductionBySpecialtiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_by_specialty = production_by_specialties(:one)
  end

  test "should get index" do
    get production_by_specialties_url
    assert_response :success
  end

  test "should get new" do
    get new_production_by_specialty_url
    assert_response :success
  end

  test "should create production_by_specialty" do
    assert_difference("ProductionBySpecialty.count") do
      post production_by_specialties_url, params: { production_by_specialty: { accomplished: @production_by_specialty.accomplished, foreseen: @production_by_specialty.foreseen, performed_per_cent: @production_by_specialty.performed_per_cent, specialty: @production_by_specialty.specialty } }
    end

    assert_redirected_to production_by_specialty_url(ProductionBySpecialty.last)
  end

  test "should show production_by_specialty" do
    get production_by_specialty_url(@production_by_specialty)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_by_specialty_url(@production_by_specialty)
    assert_response :success
  end

  test "should update production_by_specialty" do
    patch production_by_specialty_url(@production_by_specialty), params: { production_by_specialty: { accomplished: @production_by_specialty.accomplished, foreseen: @production_by_specialty.foreseen, performed_per_cent: @production_by_specialty.performed_per_cent, specialty: @production_by_specialty.specialty } }
    assert_redirected_to production_by_specialty_url(@production_by_specialty)
  end

  test "should destroy production_by_specialty" do
    assert_difference("ProductionBySpecialty.count", -1) do
      delete production_by_specialty_url(@production_by_specialty)
    end

    assert_redirected_to production_by_specialties_url
  end
end
