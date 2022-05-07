require 'rails_helper'

RSpec.describe "admins/accounts/new", type: :view do
  before(:each) do
    admin = create(:admin)
    assign(:account, Account.new(
      number: 1212121212,
      expiry: Date.today + 1.year,
      amount: 200.0,
      admin_id: admin.id
    ))
  end

  it "renders new Account form" do
    render

    assert_select "form[action=?][method=?]", admins_accounts_path, "post" do

      assert_select "input[name=?]", "account[number]"

      assert_select "input[name=?]", "account[amount]"

      assert_select "input[name=?]", "account[expiry]"
    end
  end
end
