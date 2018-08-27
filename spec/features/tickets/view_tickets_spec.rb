require 'rails_helper'

RSpec.feature "User can view tickets", type: :feature do
  before do
    sublime_text = FactoryBot.create(:project, name: "Sublime Text 3")
    FactoryBot.create(:ticket,
                      project: sublime_text,
                      name: "Implement the minimap feature",
                      description: "You may copy this from the VS Code")

    lime_text = FactoryBot.create(
      :project, name: "Lime Text Editor",
    )

    FactoryBot.create(:ticket,
                      project: lime_text,
                      name: "Implement backend in Go",
                      description: "Raise a PR for this")
    visit "/"
  end

  scenario "for a given project" do
    click_link  "Lime Text Editor"
    expect(page).to have_content("Implement backend in Go")
    expect(page).not_to have_content("Implement the minimap feature")

    click_link "Implement backend in Go"
    within("#ticket h2") do
      expect(page).to have_content("Implement backend in Go")
    end

    expect(page).to have_content("Raise a PR for this")
  end
end
