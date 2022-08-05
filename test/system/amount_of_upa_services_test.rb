require "application_system_test_case"

class AmountOfUpaServicesTest < ApplicationSystemTestCase
  setup do
    @amount_of_upa_service = amount_of_upa_services(:one)
  end

  test "visiting the index" do
    visit amount_of_upa_services_url
    assert_selector "h1", text: "Amount of upa services"
  end

  test "should create amount of upa service" do
    visit amount_of_upa_services_url
    click_on "New amount of upa service"

    fill_in "Attended", with: @amount_of_upa_service.attended
    fill_in "Classified", with: @amount_of_upa_service.classified
    fill_in "Green in the goal", with: @amount_of_upa_service.green_in_the_goal
    fill_in "Green off target", with: @amount_of_upa_service.green_off_target
    fill_in "Green time", with: @amount_of_upa_service.green_time
    fill_in "Red in the goal", with: @amount_of_upa_service.red_in_the_goal
    fill_in "Red off target", with: @amount_of_upa_service.red_off_target
    fill_in "Registered", with: @amount_of_upa_service.registered
    fill_in "Service time", with: @amount_of_upa_service.service_time
    fill_in "Welcomed", with: @amount_of_upa_service.welcomed
    fill_in "Year month", with: @amount_of_upa_service.year_month
    fill_in "Yellow in the goal", with: @amount_of_upa_service.yellow_in_the_goal
    fill_in "Yellow off target", with: @amount_of_upa_service.yellow_off_target
    fill_in "Yellow time", with: @amount_of_upa_service.yellow_time
    click_on "Create Amount of upa service"

    assert_text "Amount of upa service was successfully created"
    click_on "Back"
  end

  test "should update Amount of upa service" do
    visit amount_of_upa_service_url(@amount_of_upa_service)
    click_on "Edit this amount of upa service", match: :first

    fill_in "Attended", with: @amount_of_upa_service.attended
    fill_in "Classified", with: @amount_of_upa_service.classified
    fill_in "Green in the goal", with: @amount_of_upa_service.green_in_the_goal
    fill_in "Green off target", with: @amount_of_upa_service.green_off_target
    fill_in "Green time", with: @amount_of_upa_service.green_time
    fill_in "Red in the goal", with: @amount_of_upa_service.red_in_the_goal
    fill_in "Red off target", with: @amount_of_upa_service.red_off_target
    fill_in "Registered", with: @amount_of_upa_service.registered
    fill_in "Service time", with: @amount_of_upa_service.service_time
    fill_in "Welcomed", with: @amount_of_upa_service.welcomed
    fill_in "Year month", with: @amount_of_upa_service.year_month
    fill_in "Yellow in the goal", with: @amount_of_upa_service.yellow_in_the_goal
    fill_in "Yellow off target", with: @amount_of_upa_service.yellow_off_target
    fill_in "Yellow time", with: @amount_of_upa_service.yellow_time
    click_on "Update Amount of upa service"

    assert_text "Amount of upa service was successfully updated"
    click_on "Back"
  end

  test "should destroy Amount of upa service" do
    visit amount_of_upa_service_url(@amount_of_upa_service)
    click_on "Destroy this amount of upa service", match: :first

    assert_text "Amount of upa service was successfully destroyed"
  end
end
