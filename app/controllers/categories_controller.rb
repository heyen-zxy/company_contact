class CategoriesController < BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.order(:lft)
  end

  def new
    @category = Category.new
  end

  def show

  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to (category_path @category), notice: '创建成功' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @category.update category_params
        format.html { redirect_to (category_path @category), notice: '修改成功' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if !@category.leaf?
      respond_to do |format|
        flash[:error] = '请先删除子组织'
        format.html { redirect_to categories_path}
      end
    elsif User.where(category_id: @category.id).present?
      flash[:error] = '有员工从属于该组织'
      format.html { redirect_to categories_path}
    else
      @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_path, notice: '删除成功' }
      end
    end

  end


  private

  def set_category
    @category = Category.find_by_id params[:id].to_i
    unless @category.present?
      respond_to do |format|
        format.html {redirect_to categories_path, error: "找不到该组织"}
      end
    end
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
