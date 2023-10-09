class NotesController < ApplicationController
  include Pagy::Backend
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    @note_all = current_user.notes.includes(:user).order(created_at: :desc)
    @pagy, @notes = pagy(@note_all)
    rescue Pagy::OverflowError
    redirect_to root_path(page: 1)
  end

  def show
   
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.create!(note_params)
    respond_to do |format|
      if @note.save
        format.html { redirect_to  note_path(@note), notice: '笔记添加成功' }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @note.update(note_params)
      respond_to do |format|
        format.html { redirect_to  note_path(@note), notice: '笔记修改成功' }
      end
    else
      format.html { render :edit, status: :unprocessable_entity }
    end
  end

  def destroy
    @note.destroy!
      respond_to do |format|
        format.html { redirect_to notes_path, notice: '笔记删除成功！.' }
        format.turbo_stream
    end
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:name)
  end
end
