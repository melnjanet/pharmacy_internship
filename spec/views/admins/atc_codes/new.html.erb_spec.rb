require 'rails_helper'

RSpec.describe "admins/atc_codes/new", type: :view do
  before(:each) do
    assign(:atc_code, AtcCode.new(
      code: "A",
      title: "Alimentary tract and metabolism",
    ))
  end

  it "renders new atc_code form" do
    render

    assert_select "form[action=?][method=?]", admins_atc_codes_path, "post" do

      assert_select "input[name=?]", "atc_code[code]"

      assert_select "input[name=?]", "atc_code[title]"
    end
  end
end
