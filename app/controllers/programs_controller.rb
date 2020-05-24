class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.create(title: program_params[:title], broadcaster: program_params[:broadcaster], wday: program_params[:wday], airtime: program_params[:airtime], user_id: current_user.id)
    if @program.save
      flash[:notice] = "投稿完了しました"
      redirect_to programs_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    program = Program.find(params[:id])
    program.update(program_params)
  end

  def destroy
    program = Program.find(params[:id])
    program.destroy
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def program_params
    params.require(:program).permit(:title, :broadcaster, :wday, :airtime)
  end
end
