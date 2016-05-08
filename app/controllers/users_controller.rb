class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.joins(:category).order('categories.lft, users.updated_at desc').page(params[:page]).per(20)
  end

  def new
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to (user_path @user), notice: '创建成功' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update user_params
        format.html { redirect_to (user_path @user), notice: '修改成功' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '删除成功' }
    end
  end


  private

  def set_user
    @user = User.find_by_id params[:id].to_i
    unless @user.present?
      respond_to do |format|
        format.html {redirect_to users_path, error: "找不到该用户"}
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :tel, :address, :category_id)
  end
end
