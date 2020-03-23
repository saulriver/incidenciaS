require "application_system_test_case"

class ApplicationclientsTest < ApplicationSystemTestCase
  setup do
    @applicationclient = applicationclients(:one)
  end

  test "visiting the index" do
    visit applicationclients_url
    assert_selector "h1", text: "Applicationclients"
  end

  test "creating a Applicationclient" do
    visit applicationclients_url
    click_on "New Applicationclient"

    fill_in "Application", with: @applicationclient.application_id
    fill_in "Client", with: @applicationclient.client_id
    fill_in "Servicelevel", with: @applicationclient.servicelevel
    check "State" if @applicationclient.state
    click_on "Create Applicationclient"

    assert_text "Applicationclient was successfully created"
    click_on "Back"
  end

  test "updating a Applicationclient" do
    visit applicationclients_url
    click_on "Edit", match: :first

    fill_in "Application", with: @applicationclient.application_id
    fill_in "Client", with: @applicationclient.client_id
    fill_in "Servicelevel", with: @applicationclient.servicelevel
    check "State" if @applicationclient.state
    click_on "Update Applicationclient"

    assert_text "Applicationclient was successfully updated"
    click_on "Back"
  end

  test "destroying a Applicationclient" do
    visit applicationclients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Applicationclient was successfully destroyed"
  end
end
