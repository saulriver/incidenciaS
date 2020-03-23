require 'test_helper'

class UserclientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userclient = userclients(:one)
  end

  test "should get index" do
    get userclients_url
    assert_response :success
  end

  test "should get new" do
    get new_userclient_url
    assert_response :success
  end

  test "should create userclient" do
    assert_difference('Userclient.count') do
      post userclients_url, params: { userclient: { client_id: @userclient.client_id, user_id: @userclient.user_id } }
    end

    assert_redirected_to userclient_url(Userclient.last)
  end

  test "should show userclient" do
    get userclient_url(@userclient)
    assert_response :success
  end

  test "should get edit" do
    get edit_userclient_url(@userclient)
    assert_response :success
  end

  test "should update userclient" do
    patch userclient_url(@userclient), params: { userclient: { client_id: @userclient.client_id, user_id: @userclient.user_id } }
    assert_redirected_to userclient_url(@userclient)
  end

  test "should destroy userclient" do
    assert_difference('Userclient.count', -1) do
      delete userclient_url(@userclient)
    end

    assert_redirected_to userclients_url
  end
end
