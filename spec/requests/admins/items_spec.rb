require 'rails_helper'

RSpec.describe "Admins::Items", type: :request do
  let(:item) { create :item }
  let!(:admin) { create :admin }
  let!(:nomenclature) { create :nomenclature }

  let(:valid_attributes) {
    {
      price: 300.50,
      quantity: 10,
      admin_id: admin.id,
      nomenclature_id: nomenclature.id
    }
  }

  let(:invalid_attributes) {
    { price: nil, quantity: nil }
  }

  let(:valid_item) { create(:item, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get admins_items_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get admins_item_url(valid_item)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admins_item_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_admins_item_url(valid_item)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Item' do
        expect { post admins_items_url, params: { item: valid_attributes } }.to change(Item, :count).by(1)
      end

      it 'redirects to the created item' do
        post admins_items_url, params: { item: valid_attributes }
        expect(response).to redirect_to(admins_item_url(Item.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Item' do
        expect { post admins_items_url, params: { item: invalid_attributes } }.to change(Item, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admins_items_url, params: { item: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { price: 300,
          quantity: 1009,
        }
      }

      it 'updates the requested item' do
        patch admins_item_url(valid_item), params: { item: new_attributes }
        valid_item.reload
        expect(valid_item.price).to eq(new_attributes[:price])
        expect(valid_item.quantity).to eq(new_attributes[:quantity])
      end

      it 'redirects to the item' do
        patch admins_item_url(valid_item), params: { item: new_attributes }
        valid_item.reload
        expect(response).to redirect_to(admins_item_url(valid_item))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid item' do
        patch admins_item_url(valid_item), params: { item: invalid_attributes }
        valid_item.reload
        expect(valid_item.price).not_to eq(invalid_attributes[:price])
        expect(valid_item.quantity).not_to eq(invalid_attributes[:quantity])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:item_for_destroy) { FactoryBot.create :item }

    it 'destroys the requested item' do
      expect {
        delete admins_item_url(item_for_destroy)
      }.to change(Item, :count).by(-1)
    end

    it 'redirects to the item list' do
      delete admins_item_url(valid_item)
      expect(response).to redirect_to(admins_items_url)
    end
  end
end
