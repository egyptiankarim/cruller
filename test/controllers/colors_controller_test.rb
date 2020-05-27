require 'test_helper'

class ColorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colors_index_url
    assert_response :success
  end

  test "should get about" do
    get colors_about_url
    assert_response :success
  end

end
