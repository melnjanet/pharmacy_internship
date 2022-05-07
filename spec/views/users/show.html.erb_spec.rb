require 'rails_helper'

RSpec.describe "users/show", type: :view do
  let(:valid_user) { FactoryBot.create(:user, first_name: "John", last_name: "Dow", email: "test@test.com") }

  it "Show info about user" do
    assign(:user, valid_user)

    render

    expect(rendered).to match valid_user.first_name
    expect(rendered).to match valid_user.last_name
    expect(rendered).to match valid_user.email
  end

  it "Show link to main list" do
    assign(:user, valid_user)

    render

    expect(rendered).to match "Back"
  end

end
