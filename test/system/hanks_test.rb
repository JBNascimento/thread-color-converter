require "application_system_test_case"

class HanksTest < ApplicationSystemTestCase
  setup do
    @hank = hanks(:one)
  end

  test "visiting the index" do
    visit hanks_url
    assert_selector "h1", text: "Hanks"
  end

  test "creating a Hank" do
    visit hanks_url
    click_on "New Hank"

    fill_in "Cod anchor", with: @hank.cod_anchor
    fill_in "Cod dmc", with: @hank.cod_dmc
    fill_in "Cod maxi", with: @hank.cod_maxi
    fill_in "Name", with: @hank.name
    click_on "Create Hank"

    assert_text "Hank was successfully created"
    click_on "Back"
  end

  test "updating a Hank" do
    visit hanks_url
    click_on "Edit", match: :first

    fill_in "Cod anchor", with: @hank.cod_anchor
    fill_in "Cod dmc", with: @hank.cod_dmc
    fill_in "Cod maxi", with: @hank.cod_maxi
    fill_in "Name", with: @hank.name
    click_on "Update Hank"

    assert_text "Hank was successfully updated"
    click_on "Back"
  end

  test "destroying a Hank" do
    visit hanks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hank was successfully destroyed"
  end
end
