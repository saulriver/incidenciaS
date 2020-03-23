require 'test_helper'

class ManagefilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @managefile = managefiles(:one)
  end

  test "should get index" do
    get managefiles_url
    assert_response :success
  end

  test "should get new" do
    get new_managefile_url
    assert_response :success
  end

  test "should create managefile" do
    assert_difference('Managefile.count') do
      post managefiles_url, params: { managefile: { filetype: @managefile.filetype, incidentmanagement_id: @managefile.incidentmanagement_id, state: @managefile.state } }
    end

    assert_redirected_to managefile_url(Managefile.last)
  end

  test "should show managefile" do
    get managefile_url(@managefile)
    assert_response :success
  end

  test "should get edit" do
    get edit_managefile_url(@managefile)
    assert_response :success
  end

  test "should update managefile" do
    patch managefile_url(@managefile), params: { managefile: { filetype: @managefile.filetype, incidentmanagement_id: @managefile.incidentmanagement_id, state: @managefile.state } }
    assert_redirected_to managefile_url(@managefile)
  end

  test "should destroy managefile" do
    assert_difference('Managefile.count', -1) do
      delete managefile_url(@managefile)
    end

    assert_redirected_to managefiles_url
  end
end
