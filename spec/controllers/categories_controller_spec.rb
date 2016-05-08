require 'rails_helper'

describe CategoriesController, :type => :controller do
  #index
  context "get index" do
    it 'get#index get a array of category'  do
      category1 = Category.create(name: 'aa')
      category2 = Category.create(name: 'bb')
      get :index
      expect(assigns(:categories)).to match_array([category1, category2])
    end
    #index
    it 'get#index render the :index html'  do
      get :index
      expect(response).to render_template :index
    end
  end


  context "get#show" do
    before :each do
      @category = Category.create(name: 'aa')
      get :show, id: @category
    end

    it 'get#show get a category'  do
      expect(assigns(:category)).to eq @category
    end

    it 'get#show get a category'  do
      expect(assigns(:category)).to eq @category
    end
  end

  context "get#new" do
    before :each do
      get :new
    end
    #new
    it 'get#new render the :new html'  do
      expect(response).to render_template :new
    end
    #new
    it 'get#new assigns a new category'  do
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  context "get#edit" do
    before :each do
      @category = Category.create(name: 'aa')
      get :edit, id: @category
    end
    it 'get#edit render the :edit html'  do
      get :edit, id: @category
      expect(response).to render_template :edit
    end
    #edit
    it 'get#edit the request category contact @category'  do
      expect(assigns(:category)).to eq(@category)
    end
  end

  context "post#create" do
    it 'save the new category' do
      expect{post :create, category: {name: 'abc'}}.to change(Category, :count).by(1)
    end

    it 'redirects to categories#show' do
      post :create, category: {name: 'abc'}
      expect(response).to redirect_to category_path(assigns(:category))
    end

    it "not save invalid category" do
      expect{post :create, category: {name: ''}}.to_not change(Category, :count)
    end



    it "redirects to categories#show" do
      post :create, category: {name: ''}
      expect(response).to render_template :new
    end
  end

  context "patch#update" do
    before :each do
      @category = Category.create(name: 'abc')
    end

    it 'save the valid category' do
      patch :update, id: @category, category: {name: 'new'}
      @category.reload
      expect(@category.name).to eq('new')
    end

    it 'redirects to categories#show' do
      patch :update, id: @category, category: {name: 'new'}
      expect(response).to redirect_to category_path(@category)
    end


    it "not save invalid category" do
      patch :update, id: @category, category: {name: nil}
      @category.reload
      expect(@category.name).to_not eq(nil)
    end

    it "render :edit invalid" do
      patch :update, id: @category, category: {name: ''}
      expect(response).to render_template :edit
    end
  end

  context "delete#destroy" do
    before :each do
      @category = Category.create(name: 'abc')
    end

    it 'delete the category' do
      expect{delete :destroy, id:@category}.to change(Category, :count).by(-1)
    end

    it 'redirects to categories#index' do
      delete :destroy, id:@category
      expect(response).to redirect_to categories_path
    end
  end

end
