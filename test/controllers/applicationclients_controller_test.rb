require 'test_helper'

class ApplicationclientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicationclient = applicationclients(:one)
  end

  test "should get index" do
    get applicationclients_url
    assert_response :success
  end

  test "should get new" do
    get new_applicationclient_url
    assert_response :success
  end

  test "should create applicationclient" do
    assert_difference('Applicationclient.count') do
      post applicationclients_url, params: { applicationclient: { application_id: @applicationclient.application_id, client_id: @applicationclient.client_id, servicelevel: @applicationclient.servicelevel, state: @applicationclient.state } }
    end

    assert_redirected_to applicationclient_url(Applicationclient.last)
  end

  test "should show applicationclient" do
    get applicationclient_url(@applicationclient)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicationclient_url(@applicationclient)
    assert_response :success
  end

  test "should update applicationclient" do
    patch applicationclient_url(@applicationclient), params: { applicationclient: { application_id: @applicationclient.application_id, client_id: @applicationclient.client_id, servicelevel: @applicationclient.servicelevel, state: @applicationclient.state } }
    assert_redirected_to applicationclient_url(@applicationclient)
  end

  test "should destroy applicationclient" do
    assert_difference('Applicationclient.count', -1) do
      delete applicationclient_url(@applicationclient)
    end

    assert_redirected_to applicationclients_url
  end
end
