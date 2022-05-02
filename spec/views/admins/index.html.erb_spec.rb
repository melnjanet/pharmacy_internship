require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        age: 2,
        active: false,
        role: :pharmacist
      ),
      Admin.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        age: 2,
        active: false,
        role: :super_admin
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Role".to_s, count: 2
  end
end
