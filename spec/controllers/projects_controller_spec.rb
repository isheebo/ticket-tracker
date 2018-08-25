require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it "handles missing projects correctly" do
    get :show, params: { id: "not-here" }

    expect(response).to redirect_to(projects_path)

    message = "The project you are looking for couldn't be found"
    expect(flash[:alert]).to eq message
  end
end
