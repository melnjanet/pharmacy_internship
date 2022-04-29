require 'rails_helper'

RSpec.describe "ATC Codes", type: :request do
  let(:valid_attributes) {
    { name: 'Ukraine' }
  }

  let(:invalid_attributes) {
    { name: 'U' }
  }

  let(:valid_country) { FactoryBot.create :country }

  describe 'GET /index' do
    it 'renders a successful response' do
      get countries_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get country_url(valid_country)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_country_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_country_url(valid_country)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Country' do
        expect { post countries_url, params: { country: valid_attributes } }.to change(Country, :count).by(1)
      end

      it 'redirects to the created country' do
        post countries_url, params: { country: valid_attributes }
        expect(response).to redirect_to(country_url(Country.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Country' do
        expect { post countries_url, params: { country: invalid_attributes } }.to change(Country, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post countries_url, params: { country: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { name: 'Great Britain' }
      }

      it 'updates the requested country' do
        patch country_url(valid_country), params: { country: new_attributes }
        valid_country.reload
        expect(valid_country.name).to eq(new_attributes[:name])
      end

      it 'redirects to the country' do
        patch country_url(valid_country), params: { country: new_attributes }
        valid_country.reload
        expect(response).to redirect_to(country_url(valid_country))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid country' do
        patch country_url(valid_country), params: { country: invalid_attributes }
        valid_country.reload
        expect(valid_country.name).not_to eq(invalid_attributes[:name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:atc_code_for_destroy) { FactoryBot.create :country }

    it 'destroys the requested country' do
      expect {
        delete country_url(atc_code_for_destroy)
      }.to change(Country, :count).by(-1)
    end

    it 'redirects to the countries list' do
      delete country_url(valid_country)
      expect(response).to redirect_to(countries_url)
    end
  end
end
