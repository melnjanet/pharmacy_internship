require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      age: 1,
      active: false,
      role: :pharmacist
    ))
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(@admin), "post" do

      assert_select "input[name=?]", "admin[first_name]"

      assert_select "input[name=?]", "admin[last_name]"

      assert_select "input[name=?]", "admin[email]"

      assert_select "input[name=?]", "admin[age]"

      assert_select "input[name=?]", "admin[active]"
    end
  end
end
