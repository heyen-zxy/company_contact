require 'rails_helper'

describe UsersController, :type => :controller do
  #index
  context "get index" do
    #index
    it 'get#index render the :index html'  do
      get :index
      expect(response).to render_template :index
    end
  end


  context "get#show" do
    before :each do
      @user = User.create(category_id: 1, name: 'aa', tel: '3333', address: 'beijing')
      get :show, id: @user
    end

    it 'get#show get a user'  do
      expect(assigns(:user)).to eq @user
    end

    it 'get#show get a user'  do
      expect(assigns(:user)).to eq @user
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
    it 'get#new assigns a new user'  do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context "get#edit" do
    before :each do
      @user = User.create(category_id: 1, name: 'aa', tel: '3333', address: 'beijing')
      get :edit, id: @user
    end
    it 'get#edit render the :edit html'  do
      get :edit, id: @user
      expect(response).to render_template :edit
    end
    #edit
    it 'get#edit the request user contact @user'  do
      expect(assigns(:user)).to eq(@user)
    end
  end

  context "post#create" do
    it 'save the new user' do
      expect{post :create, user: {category_id: 1, name: 'aa', tel: '3333', address: 'beijing'}}.to change(User, :count).by(1)
    end

    it 'redirects to users#show' do
      post :create, user: {category_id: 1, name: 'aa', tel: '3333', address: 'beijing'}
      expect(response).to redirect_to user_path(assigns(:user))
    end

    it "not save invalid user" do
      expect{post :create, user: {category_id: 1, name: nil, tel: nil, address: 'beijing'}}.to_not change(User, :count)
    end



    it "render users#show" do
      post :create, user: {category_id: 1, name: nil, tel: nil, address: 'beijing'}
      expect(response).to render_template :new
    end
  end

  context "patch#update" do
    before :each do
      @user = User.create(category_id: 1, name: 'aa', tel: '3333', address: 'beijing')
    end

    it 'save the valid user' do
      patch :update, id: @user, user: {category_id: 2, name: 'bb', tel: '4444', address: 'shanghai'}
      @user.reload
      expect(@user.name).to eq('bb')
      expect(@user.category_id).to eq(2)
      expect(@user.tel).to eq('4444')
      expect(@user.address).to eq('shanghai')
    end

    it 'redirects to users#show' do
      patch :update, id: @user, user: {category_id: 2, name: 'bb', tel: '4444', address: 'shanghai'}
      expect(response).to redirect_to user_path(@user)
    end


    it "not save invalid user" do
      patch :update, id: @user, user: {category_id: 2, name: '', tel: '', address: 'shanghai'}
      @user.reload
      expect(@user.name).to_not eq(nil)
    end

    it "render :edit invalid" do
      patch :update, id: @user, user: {category_id: 2, name: '', tel: '', address: 'shanghai'}
      expect(response).to render_template :edit
    end
  end

  context "delete#destroy" do
    before :each do
      @user = User.create(category_id: 2, name: 'bb', tel: '4444', address: 'shanghai')
    end

    it 'delete the user' do
      expect{delete :destroy, id:@user}.to change(User, :count).by(-1)
    end

    it 'redirects to users#index' do
      delete :destroy, id:@user
      expect(response).to redirect_to users_path
    end
  end

end
