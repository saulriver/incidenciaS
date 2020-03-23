require 'test_helper'

class IncidentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incident = incidents(:one)
  end

  test "should get index" do
    get incidents_url
    assert_response :success
  end

  test "should get new" do
    get new_incident_url
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post incidents_url, params: { incident: { area_id: @incident.area_id, criticality_id: @incident.criticality_id, description: @incident.description, state: @incident.state, user_id: @incident.user_id, userapplication_id: @incident.userapplication_id } }
    end

    assert_redirected_to incident_url(Incident.last)
  end

  test "should show incident" do
    get incident_url(@incident)
    assert_response :success
  end

  test "should get edit" do
    get edit_incident_url(@incident)
    assert_response :success
  end

  test "should update incident" do
    patch incident_url(@incident), params: { incident: { area_id: @incident.area_id, criticality_id: @incident.criticality_id, description: @incident.description, state: @incident.state, user_id: @incident.user_id, userapplication_id: @incident.userapplication_id } }
    assert_redirected_to incident_url(@incident)
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete incident_url(@incident)
    end

    assert_redirected_to incidents_url
  end
end
