require 'rails_helper'

RSpec.describe "Carts", type: :request do
  let!(:user) { create :user }
  let(:valid_cart) { FactoryBot.create :cart }

  let(:valid_attributes) {
    {
      user_id: user.id,
    }
  }

  let(:invalid_attributes) {
    { user_id: nil }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      get carts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get cart_url(valid_cart)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_cart_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_cart_url(valid_cart)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Cart' do
        expect { post carts_url, params: { cart: valid_attributes } }.to change(Cart, :count).by(1)
      end

      it 'redirects to the created cart' do
        post carts_url, params: { cart: valid_attributes }
        expect(response).to redirect_to(cart_url(Cart.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Cart' do
        expect { post carts_url, params: { cart: invalid_attributes } }.to change(Cart, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post carts_url, params: { cart: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { user_id: user.id }
      }

      it 'updates the requested cart' do
        patch cart_url(valid_cart), params: { cart: new_attributes }
        valid_cart.reload
        expect(valid_cart.user_id).to eq(new_attributes[:user_id])
      end

      it 'redirects to the cart' do
        patch cart_url(valid_cart), params: { cart: new_attributes }
        valid_cart.reload
        expect(response).to redirect_to(cart_url(valid_cart))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid cart' do
        patch cart_url(valid_cart), params: { cart: invalid_attributes }
        valid_cart.reload
        expect(valid_cart.user_id).not_to eq(invalid_attributes[:user_id])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:cart_for_destroy) { FactoryBot.create :cart }

    it 'destroys the requested cart' do
      expect {
        delete cart_url(cart_for_destroy)
      }.to change(Cart, :count).by(-1)
    end

    it 'redirects to the carts list' do
      delete cart_url(valid_cart)
      expect(response).to redirect_to(carts_url)
    end
  end
end
