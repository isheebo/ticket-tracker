require 'rails_helper'

RSpec.feature "Logged in user can sign out", type: :feature do

  let!(:user){ FactoryBot.create(:user)}

  before do
    login_as(user)
  end

  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
