require 'rails_helper'

RSpec.describe "/accounts", type: :request do
  let(:account) { create :account }
  let!(:admin) { create :admin }

  let(:valid_attributes) {
    {
      number: 6738582379,
      amount: 120.30,
      expiry: Date.today + 1.year,
      admin_id: admin.id
    }
  }

  let(:invalid_attributes) {
    { number: nil, amount: Faker::Number.decimal, expiry: DateTime.now() }
  }

  let(:valid_account) { create(:account, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get accounts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get account_url(valid_account)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_account_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_account_url(valid_account)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Account' do
        expect { post accounts_url, params: { account: valid_attributes } }.to change(Account, :count).by(1)
      end

      it 'redirects to the created account' do
        post accounts_url, params: { account: valid_attributes }
        expect(response).to redirect_to(account_url(Account.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Account' do
        expect { post accounts_url, params: { account: invalid_attributes } }.to change(Account, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post accounts_url, params: { account: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { number: Faker::Bank.account_number,
          amount: 93604.99,
          expiry: Date.today + 1.year,
        }
      }

      it 'updates the requested account' do
        patch account_url(valid_account), params: { account: new_attributes }
        valid_account.reload
        expect(valid_account.number).to eq(new_attributes[:number].to_i)
        expect(valid_account.amount).to eq(new_attributes[:amount])
        expect(valid_account.expiry).to eq(new_attributes[:expiry])
      end

      it 'redirects to the account' do
        patch account_url(valid_account), params: { account: new_attributes }
        valid_account.reload
        expect(response).to redirect_to(account_url(valid_account))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid account' do
        patch account_url(valid_account), params: { account: invalid_attributes }
        valid_account.reload
        expect(valid_account.number).not_to eq(invalid_attributes[:number])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:account_for_destroy) { FactoryBot.create :account }

    it 'destroys the requested account' do
      expect {
        delete account_url(account_for_destroy)
      }.to change(Account, :count).by(-1)
    end

    it 'redirects to the account list' do
      delete account_url(valid_account)
      expect(response).to redirect_to(accounts_url)
    end
  end
end
