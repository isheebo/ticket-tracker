require 'rails_helper'

RSpec.feature "Users can view projects", type: :feature do
  scenario "with project details" do
    project = FactoryBot.create(:project, name: "Entebbe Express Highway")

    visit "/"
    click_link "Entebbe Express Highway"
    expect(page.current_url).to eq project_url(project)
  end
end
