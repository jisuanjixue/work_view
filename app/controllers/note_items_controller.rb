class NoteItemsController < ApplicationController
  before_action :set_note
  before_action :set_note_type
  before_action :set_note_item, only: [:edit, :update, :destory, :show]


  def new
    @note_item = @note_type.note_items.build
  end

  def create
    @note_item = @note_type.note_items.build(note_item_params)
    if @note_item.save
      respond_to do |format|
        format.html { redirect_to note_path(@note) }
        format.turbo_stream { flash.now[:notice] = '事项添加成功' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @note_item.update(note_item_params)
      respond_to do |format|
        format.html { redirect_to note_path(@note) }
        format.turbo_stream { flash.now[:notice] = '事项修改成功'}
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note_item.destroy!
    respond_to do |format|
      format.html { redirect_to note_path(@note), notice: '删除成功！.' }
      format.turbo_stream { flash.now[:notice] = '删除成功！' }
    end
  end

  private

  def note_item_params
    params.require(:note_item).permit(:title, :description)
  end

  def set_note
    @note = current_user.notes.find(params[:note_id])
  end

  def set_note_type
    @note_type = @note.note_types.find(params[:note_type_id])
  end

  def set_note_item
    @note_item = @note_type.note_items.find(params[:id])
  end
end
