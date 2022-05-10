require 'rails_helper'

RSpec.describe "Admins::AtcCodes", type: :request do
  let(:valid_attributes) {
    { code: 'A', title: 'Alimentary tract and metabolism' }
  }

  let(:invalid_attributes) {
    { code: nil, title: 'A' }
  }

  let(:valid_atc_code) { FactoryBot.create :atc_code }

  describe 'GET /index' do
    it 'renders a successful response' do
      get admins_atc_codes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get admins_atc_code_url(valid_atc_code)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admins_atc_code_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_admins_atc_code_url(valid_atc_code)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ATC Code' do
        expect { post admins_atc_codes_url, params: { atc_code: valid_attributes } }.to change(AtcCode, :count).by(1)
      end

      it 'redirects to the created atc_code' do
        post admins_atc_codes_url, params: { atc_code: valid_attributes }
        expect(response).to redirect_to(admins_atc_code_url(AtcCode.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ATCC Code' do
        expect { post admins_atc_codes_url, params: { atc_code: invalid_attributes } }.to change(AtcCode, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admins_atc_codes_url, params: { atc_code: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { code: 'A02B', title: 'Drugs for peptic ulcer and gastro-oesophageal reflux disease' }
      }

      it 'updates the requested atc_code' do
        patch admins_atc_code_url(valid_atc_code), params: { atc_code: new_attributes }
        valid_atc_code.reload
        expect(valid_atc_code.code).to eq(new_attributes[:code])
        expect(valid_atc_code.title).to eq(new_attributes[:title])
      end

      it 'redirects to the atc_code' do
        patch admins_atc_code_url(valid_atc_code), params: { atc_code: new_attributes }
        valid_atc_code.reload
        expect(response).to redirect_to(admins_atc_code_url(valid_atc_code))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid atc_code' do
        patch admins_atc_code_url(valid_atc_code), params: { atc_code: invalid_attributes }
        valid_atc_code.reload
        expect(valid_atc_code.title).not_to eq(invalid_attributes[:title])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:atc_code_for_destroy) { FactoryBot.create :atc_code }

    it 'destroys the requested atc_code' do
      expect {
        delete admins_atc_code_url(atc_code_for_destroy)
      }.to change(AtcCode, :count).by(-1)
    end

    it 'redirects to the atc_codes list' do
      delete admins_atc_code_url(valid_atc_code)
      expect(response).to redirect_to(admins_atc_codes_url)
    end
  end
end
