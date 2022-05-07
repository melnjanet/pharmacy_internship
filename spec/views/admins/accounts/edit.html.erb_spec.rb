require 'rails_helper'

RSpec.describe "admins/accounts/edit", type: :view do
  before(:each) do
    admin = create(:admin)
    @account = assign(:account, Account.create!(
      number: 1212121212,
      expiry: Date.today + 1.year,
      amount: 200.0,
      admin_id: admin.id
      ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", admins_account_path(@account), "post" do

      assert_select "input[name=?]", "account[number]"

      assert_select "input[name=?]", "account[amount]"

      assert_select "input[name=?]", "account[expiry]"
    end
  end
end
