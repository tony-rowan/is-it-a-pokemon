require "application_system_test_case"

class ApplicationTest < ApplicationSystemTestCase
  test "visiting the applicaiton" do
    visit root_url

    assert_title "Is It A Pokemon?"
    assert_text "Is It a Pokemon?"
    assert_text "No"
    assert_text "Yes"
    # TODO insert a given pokemon and assert that it is displayed  
  end
end
