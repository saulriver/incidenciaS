require "application_system_test_case"

class CriticalitiesTest < ApplicationSystemTestCase
  setup do
    @criticality = criticalities(:one)
  end

  test "visiting the index" do
    visit criticalities_url
    assert_selector "h1", text: "Criticalities"
  end

  test "creating a Criticality" do
    visit criticalities_url
    click_on "New Criticality"

    fill_in "Name", with: @criticality.name
    check "State" if @criticality.state
    click_on "Create Criticality"

    assert_text "Criticality was successfully created"
    click_on "Back"
  end

  test "updating a Criticality" do
    visit criticalities_url
    click_on "Edit", match: :first

    fill_in "Name", with: @criticality.name
    check "State" if @criticality.state
    click_on "Update Criticality"

    assert_text "Criticality was successfully updated"
    click_on "Back"
  end

  test "destroying a Criticality" do
    visit criticalities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Criticality was successfully destroyed"
  end
end
