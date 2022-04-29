require 'rails_helper'

RSpec.describe "admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new(
      first_name: "John",
      last_name: "Parker",
      email: "john@gmail.com",
      age: 25,
      active: false,
      role: :pharmacist
    ))
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", admins_path, "post" do

      assert_select "input[name=?]", "admin[first_name]"

      assert_select "input[name=?]", "admin[last_name]"

      assert_select "input[name=?]", "admin[email]"

      assert_select "input[name=?]", "admin[age]"

      assert_select "input[name=?]", "admin[active]"

      assert_select "input[name=?]", "admin[role]"
    end
  end
end
