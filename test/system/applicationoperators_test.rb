require "application_system_test_case"

class ApplicationoperatorsTest < ApplicationSystemTestCase
  setup do
    @applicationoperator = applicationoperators(:one)
  end

  test "visiting the index" do
    visit applicationoperators_url
    assert_selector "h1", text: "Applicationoperators"
  end

  test "creating a Applicationoperator" do
    visit applicationoperators_url
    click_on "New Applicationoperator"

    fill_in "Application", with: @applicationoperator.application_id
    check "State" if @applicationoperator.state
    fill_in "User", with: @applicationoperator.user_id
    click_on "Create Applicationoperator"

    assert_text "Applicationoperator was successfully created"
    click_on "Back"
  end

  test "updating a Applicationoperator" do
    visit applicationoperators_url
    click_on "Edit", match: :first

    fill_in "Application", with: @applicationoperator.application_id
    check "State" if @applicationoperator.state
    fill_in "User", with: @applicationoperator.user_id
    click_on "Update Applicationoperator"

    assert_text "Applicationoperator was successfully updated"
    click_on "Back"
  end

  test "destroying a Applicationoperator" do
    visit applicationoperators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Applicationoperator was successfully destroyed"
  end
end
