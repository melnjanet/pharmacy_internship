require 'rails_helper'

RSpec.describe "admins/accounts/index", type: :view do
  before(:each) do
    admin = create(:admin)
    assign(:accounts, [
      Account.create!(
        number: 123456789,
        expiry: Date.today + 1.year,
        admin_id: admin.id
      ),
      Account.create!(
        number: 987654321,
        expiry: Date.today + 1.year,
        admin_id: admin.id
      )
    ])
  end
  it "renders a list of account" do
    render
    expect(rendered).to match /123456789/
    expect(rendered).to match /987654321/
  end
end
