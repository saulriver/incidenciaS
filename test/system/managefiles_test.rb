require "application_system_test_case"

class ManagefilesTest < ApplicationSystemTestCase
  setup do
    @managefile = managefiles(:one)
  end

  test "visiting the index" do
    visit managefiles_url
    assert_selector "h1", text: "Managefiles"
  end

  test "creating a Managefile" do
    visit managefiles_url
    click_on "New Managefile"

    fill_in "Filetype", with: @managefile.filetype
    fill_in "Incidentmanagement", with: @managefile.incidentmanagement_id
    check "State" if @managefile.state
    click_on "Create Managefile"

    assert_text "Managefile was successfully created"
    click_on "Back"
  end

  test "updating a Managefile" do
    visit managefiles_url
    click_on "Edit", match: :first

    fill_in "Filetype", with: @managefile.filetype
    fill_in "Incidentmanagement", with: @managefile.incidentmanagement_id
    check "State" if @managefile.state
    click_on "Update Managefile"

    assert_text "Managefile was successfully updated"
    click_on "Back"
  end

  test "destroying a Managefile" do
    visit managefiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Managefile was successfully destroyed"
  end
end
