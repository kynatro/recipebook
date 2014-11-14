require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
  context "GET /recipes" do
    before { get :index }

    it { expect(assigns(:recipes)).to eq Recipe.all }
  end

  context "GET /recipes/:id" do
    context "with an existing record" do
      let!(:recipe) { create :recipe }

      before { get :show, id: recipe.id }

      it { expect(assigns(:recipe)).to eq recipe }
    end

    context "with a non-existent record" do
      before { get :show, id: 999999 }

      it { expect(response).to redirect_to recipes_url }
      it { expect(flash.now[:error]).to_not be_nil }
    end
  end

  context "PUT /recipes/:id" do
    let!(:recipe) { create :recipe }
    let(:params) { { id: recipe.id, recipe: attributes_for(:recipe) } }

    [:title, :description, :instructions].each do |prop|
      context "without params[:recipe][:#{prop}]" do
        before do
          params[:recipe][prop] = ""
          post :update, params
        end

        it { expect(flash[:error]).to_not be_nil }
        it { expect(response).to render_template(:edit) }
      end
    end

    context "with valid params[:recipe]" do
      before { post :update, params }

      it { expect(flash[:success]).to_not be_nil }
      it { expect(response).to redirect_to(recipe_url(id: recipe.id)) }
    end
  end

  context "POST /recipes" do
    let(:params) { { recipe: attributes_for(:recipe) } }

    context "with valid params" do
      before { post :create, params }

      it { expect(assigns(:recipe)).to be_an_instance_of(Recipe) }
      it { expect(response).to redirect_to recipe_url(assigns(:recipe)) }
    end

    context "with extra parameters" do
      before { post :create, params.merge(recipe: { id: 999 }) }

      it { expect(assigns(:recipe).id).to_not eq 999 }
    end

    [:title, :description, :instructions].each do |prop|
      context "without params[:recipe][:#{prop}]" do
        before do
          params[:recipe].delete prop
          post :create, params
        end

        it { expect(flash[:error]).to_not be_nil }
        it { expect(response).to render_template(:new) }
      end
    end

    context "with quantities and ingredients" do
      let(:params) {
        {
          recipe: attributes_for(:recipe).merge({
            quantities_attributes: [
              {
                amount: "1 lbs",
                ingredient_attributes: {
                  label: "Bacon"
                }
              }
            ]
          })
        }
      }

      it { expect{ post :create, params }.to change(Quantity, :count).by(1) }
      it { expect{ post :create, params }.to change(Ingredient, :count).by(1) }

      context "without a quantity amount" do
        before { params[:recipe][:quantities_attributes].first.delete :amount }
        it { expect{ post :create, params }.to change(Quantity, :count).by(0) }
        it { expect{ post :create, params }.to change(Ingredient, :count).by(0) }
      end

      context "without an ingredient name" do
        before { params[:recipe][:quantities_attributes].first[:ingredient_attributes].delete :label }
        it { expect{ post :create, params }.to change(Quantity, :count).by(0) }
        it { expect{ post :create, params }.to change(Ingredient, :count).by(0) }
      end
    end
  end

  context "GET /recipes/:id/edit" do
    context "with an existing record" do
      let!(:recipe) { create :recipe }

      before { get :edit, id: recipe.id }

      it { expect(assigns(:recipe)).to eq recipe }
    end

    context "with a non-existent record" do
      before { get :edit, id: 999999 }

      it { expect(response).to redirect_to recipes_url }
      it { expect(flash.now[:error]).to_not be_nil }
    end
  end

  context "GET /recipes/new" do
    before { get :new }

    it { expect(assigns(:recipe)).to be_an_instance_of(Recipe) }
    it { expect(assigns(:recipe)).to_not be_persisted }
  end

  context "DELETE /recipes/:id" do
    let!(:recipe) { create :recipe }

    describe "response actions" do
      before { delete :destroy, id: recipe.id }

      it { expect(assigns(:recipe)).to eq recipe }
      it { expect(flash[:success]).to_not be_nil }
      it { expect(response).to redirect_to recipes_url }
    end

    describe "database actions" do
      context "with an existing record" do
        it { expect{ delete :destroy, id: recipe.id }.to change(Recipe, :count).by(-1) }
      end
    end
  end
end
