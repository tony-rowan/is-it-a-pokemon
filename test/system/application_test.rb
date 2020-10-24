require "application_system_test_case"

class ApplicationTest < ApplicationSystemTestCase
  test "display a question" do
    visit root_url

    assert_title "Is It A Pokemon?"
    assert_text "Is It a Pokemon?"
    assert_button "No"
    assert_button "Yes"
    # TODO insert a given pokemon and assert that it is displayed
  end

  test "answering a question correctly" do
    visit root_url
    click_button "Yes"

    assert_text "Correct!"
  end

  test "answering a question incorrectly" do
    visit root_url
    click_button "No"

    assert_text "Wrong!"
  end

  test "playing again" do
    visit root_url
    click_button "No"
    click_button "Play Again"

    assert_text "Is It a Pokemon?"
    assert_button "No"
    assert_button "Yes"
  end
end
