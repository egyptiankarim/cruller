require 'test_helper'

class ColourControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colour_index_url
    assert_response :success
  end

  test "should get show" do
    get colour_show_url
    assert_response :success
  end

end
