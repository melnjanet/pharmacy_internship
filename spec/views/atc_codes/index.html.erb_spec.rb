require 'rails_helper'

RSpec.describe "atc_codes/index", type: :view do
  before(:each) do
    assign(:atc_codes, [
      AtcCode.create!(
        code: "Code",
        title: "Title",
      ),
      AtcCode.create!(
        code: "Code",
        title: "Title",
      )
    ])
  end

  it "renders a list of atc_codes" do
    render
    assert_select "tr>td", text: "Codee".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
