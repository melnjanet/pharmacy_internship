require 'rails_helper'

RSpec.describe "admins/accounts/show", type: :view do
  let!(:admin) { create :admin }
  let(:valid_account) { FactoryBot.create(:account,
                                          number: 1212121212,
                                          expiry: Date.today + 1.year,
                                          amount: 200.0,
                                          admin_id: admin.id) }

  it "Show info about Account" do
    assign(:account, valid_account)

    render

    expect(rendered).to match valid_account.number
    expect(rendered).to match valid_account.expiry
    expect(rendered).to match valid_account.amount
  end

  it "Show link to main list" do
    assign(:account, valid_account)

    render

    expect(rendered).to match 'Back'
  end
end
