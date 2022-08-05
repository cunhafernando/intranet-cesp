require "test_helper"

class AmountOfUpaServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amount_of_upa_service = amount_of_upa_services(:one)
  end

  test "should get index" do
    get amount_of_upa_services_url
    assert_response :success
  end

  test "should get new" do
    get new_amount_of_upa_service_url
    assert_response :success
  end

  test "should create amount_of_upa_service" do
    assert_difference("AmountOfUpaService.count") do
      post amount_of_upa_services_url, params: { amount_of_upa_service: { attended: @amount_of_upa_service.attended, classified: @amount_of_upa_service.classified, green_in_the_goal: @amount_of_upa_service.green_in_the_goal, green_off_target: @amount_of_upa_service.green_off_target, green_time: @amount_of_upa_service.green_time, red_in_the_goal: @amount_of_upa_service.red_in_the_goal, red_off_target: @amount_of_upa_service.red_off_target, registered: @amount_of_upa_service.registered, service_time: @amount_of_upa_service.service_time, welcomed: @amount_of_upa_service.welcomed, year_month: @amount_of_upa_service.year_month, yellow_in_the_goal: @amount_of_upa_service.yellow_in_the_goal, yellow_off_target: @amount_of_upa_service.yellow_off_target, yellow_time: @amount_of_upa_service.yellow_time } }
    end

    assert_redirected_to amount_of_upa_service_url(AmountOfUpaService.last)
  end

  test "should show amount_of_upa_service" do
    get amount_of_upa_service_url(@amount_of_upa_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_amount_of_upa_service_url(@amount_of_upa_service)
    assert_response :success
  end

  test "should update amount_of_upa_service" do
    patch amount_of_upa_service_url(@amount_of_upa_service), params: { amount_of_upa_service: { attended: @amount_of_upa_service.attended, classified: @amount_of_upa_service.classified, green_in_the_goal: @amount_of_upa_service.green_in_the_goal, green_off_target: @amount_of_upa_service.green_off_target, green_time: @amount_of_upa_service.green_time, red_in_the_goal: @amount_of_upa_service.red_in_the_goal, red_off_target: @amount_of_upa_service.red_off_target, registered: @amount_of_upa_service.registered, service_time: @amount_of_upa_service.service_time, welcomed: @amount_of_upa_service.welcomed, year_month: @amount_of_upa_service.year_month, yellow_in_the_goal: @amount_of_upa_service.yellow_in_the_goal, yellow_off_target: @amount_of_upa_service.yellow_off_target, yellow_time: @amount_of_upa_service.yellow_time } }
    assert_redirected_to amount_of_upa_service_url(@amount_of_upa_service)
  end

  test "should destroy amount_of_upa_service" do
    assert_difference("AmountOfUpaService.count", -1) do
      delete amount_of_upa_service_url(@amount_of_upa_service)
    end

    assert_redirected_to amount_of_upa_services_url
  end
end
