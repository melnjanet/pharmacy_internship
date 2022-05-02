require 'rails_helper'

RSpec.describe "Manufactures", type: :request do
  let(:valid_attributes) {
    { name: 'Cipla Ltd.' }
  }

  let(:invalid_attributes) {
    { name: 'C' }
  }

  let(:valid_manufacture) { FactoryBot.create :manufacture }

  describe 'GET /index' do
    it 'renders a successful response' do
      get manufactures_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get manufacture_url(valid_manufacture)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_manufacture_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_manufacture_url(valid_manufacture)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Manufacture' do
        expect { post manufactures_url, params: { manufacture: valid_attributes } }.to change(Manufacture, :count).by(1)
      end

      it 'redirects to the created manufacture' do
        post manufactures_url, params: { manufacture: valid_attributes }
        expect(response).to redirect_to(manufacture_url(Manufacture.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Manufacture' do
        expect { post manufactures_url, params: { manufacture: invalid_attributes } }.to change(Manufacture, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post manufactures_url, params: { manufacture: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { name: 'Bristol-Myers Squibb' }
      }

      it 'updates the requested manufacture' do
        patch manufacture_url(valid_manufacture), params: { manufacture: new_attributes }
        valid_manufacture.reload
        expect(valid_manufacture.name).to eq(new_attributes[:name])
      end

      it 'redirects to the manufacture' do
        patch manufacture_url(valid_manufacture), params: { manufacture: new_attributes }
        valid_manufacture.reload
        expect(response).to redirect_to(manufacture_url(valid_manufacture))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid manufacture' do
        patch manufacture_url(valid_manufacture), params: { manufacture: invalid_attributes }
        valid_manufacture.reload
        expect(valid_manufacture.name).not_to eq(invalid_attributes[:name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:manufacture_for_destroy) { FactoryBot.create :manufacture }

    it 'destroys the requested manufacture' do
      expect {
        delete manufacture_url(manufacture_for_destroy)
      }.to change(Manufacture, :count).by(-1)
    end

    it 'redirects to the manufactures list' do
      delete manufacture_url(valid_manufacture)
      expect(response).to redirect_to(manufactures_url)
    end
  end
end
