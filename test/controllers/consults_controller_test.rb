require 'test_helper'

class ConsultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consults_index_url
    assert_response :success
  end

end
