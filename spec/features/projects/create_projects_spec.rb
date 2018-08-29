require 'rails_helper'

RSpec.feature "Users can create Projects", type: :feature do
  let!(:user) { FactoryBot.create(:user, :admin) }

  before do
    login_as(user)

    visit "/"
    click_link "New Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "The Text Editor for everyone"
    click_button "Create Project"

    expect(page).to have_content("Project has been created")

    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq project_url(project)
    title = "Sublime Text 3 - Projects - TicketTracker"
    expect(page).to have_title(title)
  end

  scenario "when validating attributes" do
    click_button "Create Project"
    expect(page).to have_content("Project has not been created")
    expect(page).to have_content("Name can't be blank")
  end
end
