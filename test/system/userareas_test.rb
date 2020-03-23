require "application_system_test_case"

class UserareasTest < ApplicationSystemTestCase
  setup do
    @userarea = userareas(:one)
  end

  test "visiting the index" do
    visit userareas_url
    assert_selector "h1", text: "Userareas"
  end

  test "creating a Userarea" do
    visit userareas_url
    click_on "New Userarea"

    fill_in "Area", with: @userarea.area_id
    check "State" if @userarea.state
    fill_in "User", with: @userarea.user_id
    click_on "Create Userarea"

    assert_text "Userarea was successfully created"
    click_on "Back"
  end

  test "updating a Userarea" do
    visit userareas_url
    click_on "Edit", match: :first

    fill_in "Area", with: @userarea.area_id
    check "State" if @userarea.state
    fill_in "User", with: @userarea.user_id
    click_on "Update Userarea"

    assert_text "Userarea was successfully updated"
    click_on "Back"
  end

  test "destroying a Userarea" do
    visit userareas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userarea was successfully destroyed"
  end
end
