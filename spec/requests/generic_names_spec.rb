require 'rails_helper'

RSpec.describe "Generic Names", type: :request do
  let(:valid_attributes) {
    { title: 'alendronate tablet' }
  }

  let(:invalid_attributes) {
    { title: 'a' }
  }

  let(:valid_generic_name) { FactoryBot.create :generic_name }

  describe 'GET /index' do
    it 'renders a successful response' do
      get generic_names_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get generic_name_url(valid_generic_name)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_generic_name_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_generic_name_url(valid_generic_name)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Generic Name' do
        expect { post generic_names_url, params: { generic_name: valid_attributes } }.to change(GenericName, :count).by(1)
      end

      it 'redirects to the created generic_name' do
        post generic_names_url, params: { generic_name: valid_attributes }
        expect(response).to redirect_to(generic_name_url(GenericName.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Generic Name' do
        expect { post generic_names_url, params: { generic_name: invalid_attributes } }.to change(GenericName, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post generic_names_url, params: { generic_name: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { code: 'A02B', title: 'Drugs for peptic ulcer and gastro-oesophageal reflux disease' }
      }

      it 'updates the requested generic_name' do
        patch generic_name_url(valid_generic_name), params: { generic_name: new_attributes }
        valid_generic_name.reload
        expect(valid_generic_name.title).to eq(new_attributes[:title])
      end

      it 'redirects to the generic_name' do
        patch generic_name_url(valid_generic_name), params: { generic_name: new_attributes }
        valid_generic_name.reload
        expect(response).to redirect_to(generic_name_url(valid_generic_name))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid generic_name' do
        patch generic_name_url(valid_generic_name), params: { generic_name: invalid_attributes }
        valid_generic_name.reload
        expect(valid_generic_name.title).not_to eq(invalid_attributes[:title])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:generic_name_for_destroy) { FactoryBot.create :generic_name }

    it 'destroys the requested generic_name' do
      expect {
        delete generic_name_url(generic_name_for_destroy)
      }.to change(GenericName, :count).by(-1)
    end

    it 'redirects to the generic_names list' do
      delete generic_name_url(valid_generic_name)
      expect(response).to redirect_to(generic_names_url)
    end
  end
end
