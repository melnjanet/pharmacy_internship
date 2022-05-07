require 'rails_helper'

RSpec.describe "Admins::Nomenclatures", type: :request do
  let!(:atc_code) { create :atc_code }
  let!(:country) { create :country }
  let!(:generic_name) { create :generic_name }
  let!(:manufacture) { create :manufacture }
  let!(:nomenclature) { create :nomenclature }

  let(:valid_attributes) {
    {
      atc_code_id: atc_code.id,
      country_id: country.id,
      generic_name_id: generic_name.id,
      manufacture_id: manufacture.id,
      brand_name: Faker::Lorem.characters(number: 30),
      description: 'Zovirax cream',
      age_group: :adult,
      dosage_form: :cream,
      package_size: 2,
      package_units: :g,
      prescription: true,
      created_at: DateTime.now()
    }
  }

  let(:invalid_attributes) {
    { brand_name: 'Z', dosage_form: nil, package_units: nil, description: nil, strength: nil  }
  }

  let(:valid_nomenclature) { create(:nomenclature, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get admins_nomenclatures_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get admins_nomenclature_url(valid_nomenclature)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admins_nomenclature_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_admins_nomenclature_url(valid_nomenclature)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Nomenclature' do
        expect { post admins_nomenclatures_url, params: { nomenclature: valid_attributes } }.to change(Nomenclature, :count).by(1)
      end

      it 'redirects to the created nomenclature' do
        post admins_nomenclatures_url, params: { nomenclature: valid_attributes }
        expect(response).to redirect_to(admins_nomenclature_url(Nomenclature.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Nomenclature' do
        expect { post admins_nomenclatures_url, params: { nomenclature: invalid_attributes } }.to change(Nomenclature, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admins_nomenclatures_url, params: { nomenclature: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { description: 'Cream belongs to a class of drugs called Antivirals.' }
      }

      it 'updates the requested nomenclature' do
        patch admins_nomenclature_url(valid_nomenclature), params: { nomenclature: new_attributes }
        valid_nomenclature.reload
        expect(valid_nomenclature.description).to eq(new_attributes[:description])
      end

      it 'redirects to the nomenclature' do
        patch admins_nomenclature_url(valid_nomenclature), params: { nomenclature: new_attributes }
        valid_nomenclature.reload
        expect(response).to redirect_to(admins_nomenclature_url(valid_nomenclature))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid nomenclature' do
        patch admins_nomenclature_url(valid_nomenclature), params: { nomenclature: invalid_attributes }
        valid_nomenclature.reload
        expect(valid_nomenclature.brand_name).not_to eq(invalid_attributes[:brand_name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:nomenclature_for_destroy) { FactoryBot.create :nomenclature }

    it 'destroys the requested nomenclature' do
      expect {
        delete admins_nomenclature_url(nomenclature_for_destroy)
      }.to change(Nomenclature, :count).by(-1)
    end

    it 'redirects to the nomenclature list' do
      delete admins_nomenclature_url(valid_nomenclature)
      expect(response).to redirect_to(admins_nomenclatures_url)
    end
  end
end
