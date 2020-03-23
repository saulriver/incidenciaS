require "application_system_test_case"

class UserapplicationsTest < ApplicationSystemTestCase
  setup do
    @userapplication = userapplications(:one)
  end

  test "visiting the index" do
    visit userapplications_url
    assert_selector "h1", text: "Userapplications"
  end

  test "creating a Userapplication" do
    visit userapplications_url
    click_on "New Userapplication"

    fill_in "Applicationclient", with: @userapplication.applicationclient_id
    check "State" if @userapplication.state
    fill_in "User", with: @userapplication.user_id
    click_on "Create Userapplication"

    assert_text "Userapplication was successfully created"
    click_on "Back"
  end

  test "updating a Userapplication" do
    visit userapplications_url
    click_on "Edit", match: :first

    fill_in "Applicationclient", with: @userapplication.applicationclient_id
    check "State" if @userapplication.state
    fill_in "User", with: @userapplication.user_id
    click_on "Update Userapplication"

    assert_text "Userapplication was successfully updated"
    click_on "Back"
  end

  test "destroying a Userapplication" do
    visit userapplications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userapplication was successfully destroyed"
  end
end
