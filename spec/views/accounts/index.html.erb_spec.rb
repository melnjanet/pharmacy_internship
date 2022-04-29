require 'rails_helper'

RSpec.describe "account/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        FactoryBot :account
      ),
      Account.create!(
        FactoryBot :account
      )
    ])
  end

  it "renders a list of account" do
    render
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: "Amount".to_s, count: 2
    assert_select "tr>td", text: "Expiry".to_s, count: 2
  end
end
