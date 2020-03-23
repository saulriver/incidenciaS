require 'test_helper'

class UserareasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userarea = userareas(:one)
  end

  test "should get index" do
    get userareas_url
    assert_response :success
  end

  test "should get new" do
    get new_userarea_url
    assert_response :success
  end

  test "should create userarea" do
    assert_difference('Userarea.count') do
      post userareas_url, params: { userarea: { area_id: @userarea.area_id, state: @userarea.state, user_id: @userarea.user_id } }
    end

    assert_redirected_to userarea_url(Userarea.last)
  end

  test "should show userarea" do
    get userarea_url(@userarea)
    assert_response :success
  end

  test "should get edit" do
    get edit_userarea_url(@userarea)
    assert_response :success
  end

  test "should update userarea" do
    patch userarea_url(@userarea), params: { userarea: { area_id: @userarea.area_id, state: @userarea.state, user_id: @userarea.user_id } }
    assert_redirected_to userarea_url(@userarea)
  end

  test "should destroy userarea" do
    assert_difference('Userarea.count', -1) do
      delete userarea_url(@userarea)
    end

    assert_redirected_to userareas_url
  end
end
