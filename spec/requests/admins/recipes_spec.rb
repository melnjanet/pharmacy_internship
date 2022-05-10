require 'rails_helper'

RSpec.describe "Admins::Recipes", type: :request do
  let(:recipe) { create :recipe }
  let!(:admin) { create :admin }
  let!(:item) { create :item }
  let!(:order) { create :order }
  let!(:user) { create :user }

  let(:valid_attributes) {
    {
      age_group: :adult,
      expiry: Date.today + 1.year,
      number: Faker::Lorem.characters(number: 8),
      quantity: 5,
      used: true,
      admin_id: admin.id,
      item_id: item.id,
      user_id: user.id,
      order_id: order.id,
    }
  }

  let(:invalid_attributes) {
    { number: nil, quantity: 0 }
  }

  let(:valid_recipe) { create(:recipe, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get admins_recipes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get admins_recipe_url(valid_recipe)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admins_recipe_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_admins_recipe_url(valid_recipe)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Recipe' do
        expect { post admins_recipes_url, params: { recipe: valid_attributes } }.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        post admins_recipes_url, params: { recipe: valid_attributes }
        expect(response).to redirect_to(admins_recipe_url(Recipe.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Recipe' do
        expect { post admins_recipes_url, params: { recipe: invalid_attributes } }.to change(Recipe, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admins_recipes_url, params: { recipe: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        {
          number: Faker::Lorem.characters(number: 8),
          quantity: 4 ,
          age_group: :child,
          expiry: Date.today + 3.months,
        }
      }

      it 'updates the requested recipe' do
        patch admins_recipe_url(valid_recipe), params: { recipe: new_attributes }
        valid_recipe.reload
        expect(valid_recipe.number).to eq(new_attributes[:number])
        expect(valid_recipe.quantity).to eq(new_attributes[:quantity])
        expect(valid_recipe.age_group).to eq(new_attributes[:age_group].to_s)
        expect(valid_recipe.expiry).to eq(new_attributes[:expiry])
      end

      it 'redirects to the recipe' do
        patch admins_recipe_url(valid_recipe), params: { recipe: new_attributes }
        valid_recipe.reload
        expect(response).to redirect_to(admins_recipe_url(valid_recipe))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response but not change valid recipe' do
        patch admins_recipe_url(valid_recipe), params: { recipe: invalid_attributes }
        valid_recipe.reload
        expect(valid_recipe.number).not_to eq(invalid_attributes[:number])
        expect(valid_recipe.quantity).not_to eq(invalid_attributes[:quantity])
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:recipe_for_destroy) { FactoryBot.create :recipe }

    it 'destroys the requested recipe' do
      expect {
        delete admins_recipe_url(recipe_for_destroy)
      }.to change(Recipe, :count).by(-1)
    end

    it 'redirects to the recipe list' do
      delete admins_recipe_url(valid_recipe)
      expect(response).to redirect_to(admins_recipes_url)
    end
  end
end
