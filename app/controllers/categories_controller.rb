class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :destroy]
  before_action :set_note

  def index

  end

  def show

  end

  def new
    @category = @note.categories.build
  end

  def edit

  end

  def create
    @category = @note.categories.build(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to note_categories_path }
        format.turbo_stream { flash.now[:notice] = '笔记分类添加成功'}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.html { redirect_to note_categories_path }
        format.turbo_stream { flash.now[:notice] = '笔记分类修改成功'}
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!
      respond_to do |format|
        format.html { redirect_to note_categories_path, notice: '笔记分类删除成功！.' }
        format.turbo_stream { flash.now[:notice] = '笔记分类删除成功！' }
    end
  end

  private

  def set_category
    @category = @note.categories.find(params[:id])
  end

  def set_note
    @note = current_user.notes.find(params[:note_id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
