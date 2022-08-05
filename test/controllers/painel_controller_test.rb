require "test_helper"

class PainelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get painel_index_url
    assert_response :success
  end

  test "should get show" do
    get painel_show_url
    assert_response :success
  end
end
