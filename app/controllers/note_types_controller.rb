class NoteTypesController < ApplicationController
  before_action :set_note
  before_action :set_note_type, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def new
    @note_type = @note.note_types.build
  end

  def create
    @note_type = @note.note_types.build(note_type_params)
    if @note_type.save
      respond_to do |format|
        format.html { redirect_to note_path(@note) }
        format.turbo_stream { flash.now[:notice] = '笔记分类添加成功'}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @note_type.update(note_type_params)
      respond_to do |format|
        format.html { redirect_to note_path(@note) }
        format.turbo_stream { flash.now[:notice] = '笔记分类修改成功'}
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note_type.destroy!
      respond_to do |format|
        format.html { redirect_to note_path(@note), notice: '笔记分类删除成功！.' }
        format.turbo_stream { flash.now[:notice] = '笔记分类删除成功！' }
    end
  end

  private

  def set_note_type
    @note_type = @note.note_types.find(params[:id])
  end

  def set_note
    @note = current_user.notes.find(params[:note_id])
  end

  def note_type_params
    params.require(:note_type).permit(:name, :show)
  end
end
