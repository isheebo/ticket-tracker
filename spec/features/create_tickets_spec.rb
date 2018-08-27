require 'rails_helper'

RSpec.feature "User can create new Tickets", type: :feature do
  before do
    project = FactoryBot.create(:project, name: 'Internet Explorer')

    visit project_path(project)
    click_link "New Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: 'Increase browser efficiency'
    fill_in "Description", with: 'Bring this browser up to speed'

    click_button "Create Ticket"
    expect(page).to have_content "Ticket has been created"
  end

  scenario "with invalid attributes" do
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "with an invalid description" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "Hmmm!"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created"
    expect(page).to have_content "Description is too short"
  end
end
