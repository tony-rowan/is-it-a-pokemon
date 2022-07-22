require "rails_helper"

RSpec.feature "Quiz" do
  scenario "First time visit" do
    create(:question, name: "Pikachu")

    visit(root_path)

    expect(page).to have_text("Is It a Pokémon?")
    expect(page).to have_text("Pikachu")
    expect(page).to have_button("Yes")
    expect(page).to have_button("No")
    expect(page).to have_no_text("Score")
  end

  scenario "Correctly identifying an actual Pokémon" do
    create(:pokemon, number: 25, name: "Pikachu")
    create(:question, name: "Pikachu")

    visit(root_path)
    click_on("Yes")

    expect(page).to have_text("That's Right!")
    expect(page).to have_link("Play Again", href: root_path)
    expect(page).to have_text("Your Score")
    expect(page).to have_text("1/1")
  end

  scenario "Correctly identifying a fake Pokémon" do
    create(:question, name: "Nopeachu")

    visit(root_path)
    click_on("No")

    expect(page).to have_text("That's Right!")
    expect(page).to have_link("Play Again", href: root_path)
    expect(page).to have_text("Your Score")
    expect(page).to have_text("1/1")
  end

  scenario "Missing a real Pokémon" do
    create(:pokemon, number: 25, name: "Pikachu")
    create(:question, name: "Pikachu")

    visit(root_path)
    click_on("No")

    expect(page).to have_text("Wrong!")
    expect(page).to have_link("Play Again", href: root_path)
    expect(page).to have_text("Your Score")
    expect(page).to have_text("0/1")
  end

  scenario "Being tricked by a fake Pokémon" do
    create(:question, name: "Nopeachu")

    visit(root_path)
    click_on("Yes")

    expect(page).to have_text("Wrong!")
    expect(page).to have_link("Play Again", href: root_path)
    expect(page).to have_text("Your Score")
    expect(page).to have_text("0/1")
  end

  scenario "Playing several rounds correctly" do
    create(:pokemon, number: 25, name: "Pikachu")
    create(:question, name: "Pikachu")

    visit(root_path)
    click_on("Yes")
    click_on("Play Again")
    click_on("Yes")
    click_on("Play Again")
    click_on("Yes")

    expect(page).to have_text("That's Right!")
    expect(page).to have_link("Play Again", href: root_path)
    expect(page).to have_text("Your Score")
    expect(page).to have_text("3/3")
  end

  scenario "Playing several rounds incorrectly" do
    create(:question, name: "Nopeachu")

    visit(root_path)
    click_on("Yes")
    click_on("Play Again")
    click_on("Yes")
    click_on("Play Again")
    click_on("Yes")

    expect(page).to have_text("Wrong!")
    expect(page).to have_link("Play Again", href: root_path)
    expect(page).to have_text("Your Score")
    expect(page).to have_text("0/3")
  end
end
