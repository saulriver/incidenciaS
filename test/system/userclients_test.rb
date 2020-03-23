require "application_system_test_case"

class UserclientsTest < ApplicationSystemTestCase
  setup do
    @userclient = userclients(:one)
  end

  test "visiting the index" do
    visit userclients_url
    assert_selector "h1", text: "Userclients"
  end

  test "creating a Userclient" do
    visit userclients_url
    click_on "New Userclient"

    fill_in "Client", with: @userclient.client_id
    fill_in "User", with: @userclient.user_id
    click_on "Create Userclient"

    assert_text "Userclient was successfully created"
    click_on "Back"
  end

  test "updating a Userclient" do
    visit userclients_url
    click_on "Edit", match: :first

    fill_in "Client", with: @userclient.client_id
    fill_in "User", with: @userclient.user_id
    click_on "Update Userclient"

    assert_text "Userclient was successfully updated"
    click_on "Back"
  end

  test "destroying a Userclient" do
    visit userclients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userclient was successfully destroyed"
  end
end
