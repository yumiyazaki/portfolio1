class ProgramsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to programs_path, notice: "投稿完了しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :index
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
