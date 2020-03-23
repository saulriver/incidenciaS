require 'test_helper'

class CriticalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criticality = criticalities(:one)
  end

  test "should get index" do
    get criticalities_url
    assert_response :success
  end

  test "should get new" do
    get new_criticality_url
    assert_response :success
  end

  test "should create criticality" do
    assert_difference('Criticality.count') do
      post criticalities_url, params: { criticality: { name: @criticality.name, state: @criticality.state } }
    end

    assert_redirected_to criticality_url(Criticality.last)
  end

  test "should show criticality" do
    get criticality_url(@criticality)
    assert_response :success
  end

  test "should get edit" do
    get edit_criticality_url(@criticality)
    assert_response :success
  end

  test "should update criticality" do
    patch criticality_url(@criticality), params: { criticality: { name: @criticality.name, state: @criticality.state } }
    assert_redirected_to criticality_url(@criticality)
  end

  test "should destroy criticality" do
    assert_difference('Criticality.count', -1) do
      delete criticality_url(@criticality)
    end

    assert_redirected_to criticalities_url
  end
end
