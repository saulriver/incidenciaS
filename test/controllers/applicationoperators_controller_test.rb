require 'test_helper'

class ApplicationoperatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicationoperator = applicationoperators(:one)
  end

  test "should get index" do
    get applicationoperators_url
    assert_response :success
  end

  test "should get new" do
    get new_applicationoperator_url
    assert_response :success
  end

  test "should create applicationoperator" do
    assert_difference('Applicationoperator.count') do
      post applicationoperators_url, params: { applicationoperator: { application_id: @applicationoperator.application_id, state: @applicationoperator.state, user_id: @applicationoperator.user_id } }
    end

    assert_redirected_to applicationoperator_url(Applicationoperator.last)
  end

  test "should show applicationoperator" do
    get applicationoperator_url(@applicationoperator)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicationoperator_url(@applicationoperator)
    assert_response :success
  end

  test "should update applicationoperator" do
    patch applicationoperator_url(@applicationoperator), params: { applicationoperator: { application_id: @applicationoperator.application_id, state: @applicationoperator.state, user_id: @applicationoperator.user_id } }
    assert_redirected_to applicationoperator_url(@applicationoperator)
  end

  test "should destroy applicationoperator" do
    assert_difference('Applicationoperator.count', -1) do
      delete applicationoperator_url(@applicationoperator)
    end

    assert_redirected_to applicationoperators_url
  end
end
