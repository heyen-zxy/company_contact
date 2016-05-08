class Api::V1::UsersController < Api::V1::BaseController

  def index
    @users =  User.joins(:category).order('categories.lft, users.updated_at desc').page(params[:page]).per(20)
  end

  def show
    @user = User.where(id: params[:id]).first
    @message = @user.present? ? '' : "找不到该员工"
  end

end
