require "application_system_test_case"

class IncidentmanagementsTest < ApplicationSystemTestCase
  setup do
    @incidentmanagement = incidentmanagements(:one)
  end

  test "visiting the index" do
    visit incidentmanagements_url
    assert_selector "h1", text: "Incidentmanagements"
  end

  test "creating a Incidentmanagement" do
    visit incidentmanagements_url
    click_on "New Incidentmanagement"

    fill_in "Description", with: @incidentmanagement.description
    fill_in "Incident", with: @incidentmanagement.incident_id
    check "State" if @incidentmanagement.state
    fill_in "User", with: @incidentmanagement.user_id
    click_on "Create Incidentmanagement"

    assert_text "Incidentmanagement was successfully created"
    click_on "Back"
  end

  test "updating a Incidentmanagement" do
    visit incidentmanagements_url
    click_on "Edit", match: :first

    fill_in "Description", with: @incidentmanagement.description
    fill_in "Incident", with: @incidentmanagement.incident_id
    check "State" if @incidentmanagement.state
    fill_in "User", with: @incidentmanagement.user_id
    click_on "Update Incidentmanagement"

    assert_text "Incidentmanagement was successfully updated"
    click_on "Back"
  end

  test "destroying a Incidentmanagement" do
    visit incidentmanagements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Incidentmanagement was successfully destroyed"
  end
end
