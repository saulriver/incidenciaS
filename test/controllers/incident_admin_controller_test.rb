require 'test_helper'

class IncidentAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get incident_admin_index_url
    assert_response :success
  end

  test "should get assign_incident" do
    get incident_admin_assign_incident_url
    assert_response :success
  end

end
