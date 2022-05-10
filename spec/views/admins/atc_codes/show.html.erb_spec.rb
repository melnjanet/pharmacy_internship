require 'rails_helper'

RSpec.describe "admins/atc_codes/show", type: :view do
  let(:valid_atc_code) { FactoryBot.create(:atc_code, code: 'A', title: 'Alimentary tract and metabolism') }

  it "Show info about ATC Code" do
    assign(:atc_code, valid_atc_code)

    render

    expect(rendered).to match valid_atc_code.code
    expect(rendered).to match valid_atc_code.title
  end

  it "Show link to main list" do
    assign(:atc_code, valid_atc_code)

    render

    expect(rendered).to match 'Back'
  end
end
