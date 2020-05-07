class ProgramsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    Program.create(title: program_params[:title], broadcaster: program_params[:broadcaster], user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def program_params
    params.require(:program).permit(:title, :broadcaster, :wday, :airtime)
  end
end
