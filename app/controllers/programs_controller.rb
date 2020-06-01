class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(
      title: program_params[:title],
      broadcaster: program_params[:broadcaster],
      wday: program_params[:wday],
      airtime: program_params[:airtime],
      user_id: current_user.id
    )
    if @program.save
      flash[:info] = "投稿完了しました"
      redirect_to programs_path
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    if @program.update(program_params)
      flash[:info] = "記録作品を編集しました。"
      redirect_to user_path
    else
      flash.now[:danger] = "記録作品の編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @program = Program.find(params[:id])
    if @program.destroy
      flash[:info] = "記録作品を削除しました"
      redirect_to user_path
    else
      flash[:danger] = "記録作品の削除に失敗しました"
      render :index
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def program_params
    params.require(:program).permit(:title, :broadcaster, :wday, :airtime)
  end

end
