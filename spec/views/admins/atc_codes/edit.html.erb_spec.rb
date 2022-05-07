require 'rails_helper'

RSpec.describe "admins/atc_codes/edit", type: :view do
  before(:each) do
    @atc_code = assign(:atc_code, AtcCode.create!(
      code: "A",
      title: "Alimentary tract and metabolism",
    ))
  end

  it "renders the edit atc_code form" do
    render

    assert_select "form[action=?][method=?]", admins_atc_code_path(@atc_code), "post" do

      assert_select "input[name=?]", "atc_code[code]"

      assert_select "input[name=?]", "atc_code[title]"
    end
  end
end
