require 'rails_helper'

RSpec.describe "atc_codes/show", type: :view do
  before(:each) do
    @atc_code = assign(:atc_code, AtcCode.create!(
      code: "Code",
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Title/)
  end
end
