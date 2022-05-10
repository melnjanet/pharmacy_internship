require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:valid_users) { [
    FactoryBot.create(:user, first_name: "John", last_name: "Dow", email: "test@test.com"),
    FactoryBot.create(:user, first_name: "Bridie", last_name: "Huang", email: "br.huang@test.com")
  ] }


  it "renders a list of users" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
