require "application_system_test_case"

class IncidentfilesTest < ApplicationSystemTestCase
  setup do
    @incidentfile = incidentfiles(:one)
  end

  test "visiting the index" do
    visit incidentfiles_url
    assert_selector "h1", text: "Incidentfiles"
  end

  test "creating a Incidentfile" do
    visit incidentfiles_url
    click_on "New Incidentfile"

    fill_in "Filetype", with: @incidentfile.filetype
    fill_in "Incident", with: @incidentfile.incident_id
    check "State" if @incidentfile.state
    click_on "Create Incidentfile"

    assert_text "Incidentfile was successfully created"
    click_on "Back"
  end

  test "updating a Incidentfile" do
    visit incidentfiles_url
    click_on "Edit", match: :first

    fill_in "Filetype", with: @incidentfile.filetype
    fill_in "Incident", with: @incidentfile.incident_id
    check "State" if @incidentfile.state
    click_on "Update Incidentfile"

    assert_text "Incidentfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Incidentfile" do
    visit incidentfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Incidentfile was successfully destroyed"
  end
end
