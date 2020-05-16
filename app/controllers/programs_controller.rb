class ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    Program.create(title: program_params[:title], broadcaster: program_params[:broadcaster], wday: program_params[:wday], airtime: program_params[:airtime], user_id: current_user.id)
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

  private

  def program_params
    params.require(:program).permit(:title, :broadcaster, :wday, :airtime)
  end
end
