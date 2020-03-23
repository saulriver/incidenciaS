require 'test_helper'

class IncidentfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incidentfile = incidentfiles(:one)
  end

  test "should get index" do
    get incidentfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_incidentfile_url
    assert_response :success
  end

  test "should create incidentfile" do
    assert_difference('Incidentfile.count') do
      post incidentfiles_url, params: { incidentfile: { filetype: @incidentfile.filetype, incident_id: @incidentfile.incident_id, state: @incidentfile.state } }
    end

    assert_redirected_to incidentfile_url(Incidentfile.last)
  end

  test "should show incidentfile" do
    get incidentfile_url(@incidentfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_incidentfile_url(@incidentfile)
    assert_response :success
  end

  test "should update incidentfile" do
    patch incidentfile_url(@incidentfile), params: { incidentfile: { filetype: @incidentfile.filetype, incident_id: @incidentfile.incident_id, state: @incidentfile.state } }
    assert_redirected_to incidentfile_url(@incidentfile)
  end

  test "should destroy incidentfile" do
    assert_difference('Incidentfile.count', -1) do
      delete incidentfile_url(@incidentfile)
    end

    assert_redirected_to incidentfiles_url
  end
end
