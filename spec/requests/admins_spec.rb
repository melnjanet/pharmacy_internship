require 'rails_helper'

RSpec.describe "Admins", type: :request do
  let(:valid_attributes) {
    { first_name: 'Jim', last_name: 'Parker', email: Faker::Internet.email, age: 20, active:  Faker::Boolean.boolean,
      role: :super_user}
  }

  let(:invalid_attributes) {
    { first_name: 'J', last_name: 'P' }
  }

  let(:valid_admin) { FactoryBot.create :admin }

  describe 'GET /index' do
    it 'renders a successful response' do
      get admins_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get admin_url(valid_admin)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_admin_url(valid_admin)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Admin' do
        expect { post admins_url, params: { admin: valid_attributes } }.to change(Admin, :count).by(1)
      end

      it 'redirects to the created admin' do
        post admins_url, params: { admin: valid_attributes }
        expect(response).to redirect_to(admin_url(Admin.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Admin' do
        expect { post admins_url, params: { admin: invalid_attributes } }.to change(Admin, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admins_url, params: { admin: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { first_name: 'Jimmy', last_name: 'Brown', email: 'updated_test@test.com', age: 35 }
      }

      it 'updates the requested admin' do
        patch admin_url(valid_admin), params: { admin: new_attributes }
        valid_admin.reload
        expect(valid_admin.first_name).to eq(new_attributes[:first_name])
        expect(valid_admin.last_name).to eq(new_attributes[:last_name])
        expect(valid_admin.age).to eq(new_attributes[:age])
      end

      it 'redirects to the admin' do
        patch admin_url(valid_admin), params: { admin: new_attributes }
        valid_admin.reload
        expect(response).to redirect_to(admin_url(valid_admin))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid admin' do
        patch admin_url(valid_admin), params: { admin: invalid_attributes }
        valid_admin.reload
        expect(valid_admin.first_name).not_to eq(invalid_attributes[:first_name])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:admin_for_destroy) { FactoryBot.create :admin }

    it 'destroys the requested admin' do
      expect {
        delete admin_url(admin_for_destroy)
      }.to change(Admin, :count).by(-1)
    end

    it 'redirects to the admins list' do
      delete admin_url(valid_admin)
      expect(response).to redirect_to(admins_url)
    end
  end
end
