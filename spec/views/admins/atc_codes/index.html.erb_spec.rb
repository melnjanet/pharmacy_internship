require 'rails_helper'

RSpec.describe "admins/atc_codes/index", type: :view do
  before(:each) do
    assign(:atc_codes, [
      AtcCode.create!(
        code: "A",
        title: "Alimentary tract and metabolism",
      ),
      AtcCode.create!(
        code: "A02",
        title: "Drugs for acid-related disorders",
      )
    ])
  end

  it "renders a list of atc_codes" do
    render
    expect(rendered).to match /A/
    expect(rendered).to match /Alimentary tract and metabolism/
    expect(rendered).to match /A02/
    expect(rendered).to match /Drugs for acid-related disorders/
  end
end
