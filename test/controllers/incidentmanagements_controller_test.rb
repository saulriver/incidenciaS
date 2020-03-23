require 'test_helper'

class IncidentmanagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incidentmanagement = incidentmanagements(:one)
  end

  test "should get index" do
    get incidentmanagements_url
    assert_response :success
  end

  test "should get new" do
    get new_incidentmanagement_url
    assert_response :success
  end

  test "should create incidentmanagement" do
    assert_difference('Incidentmanagement.count') do
      post incidentmanagements_url, params: { incidentmanagement: { description: @incidentmanagement.description, incident_id: @incidentmanagement.incident_id, state: @incidentmanagement.state, user_id: @incidentmanagement.user_id } }
    end

    assert_redirected_to incidentmanagement_url(Incidentmanagement.last)
  end

  test "should show incidentmanagement" do
    get incidentmanagement_url(@incidentmanagement)
    assert_response :success
  end

  test "should get edit" do
    get edit_incidentmanagement_url(@incidentmanagement)
    assert_response :success
  end

  test "should update incidentmanagement" do
    patch incidentmanagement_url(@incidentmanagement), params: { incidentmanagement: { description: @incidentmanagement.description, incident_id: @incidentmanagement.incident_id, state: @incidentmanagement.state, user_id: @incidentmanagement.user_id } }
    assert_redirected_to incidentmanagement_url(@incidentmanagement)
  end

  test "should destroy incidentmanagement" do
    assert_difference('Incidentmanagement.count', -1) do
      delete incidentmanagement_url(@incidentmanagement)
    end

    assert_redirected_to incidentmanagements_url
  end
end
