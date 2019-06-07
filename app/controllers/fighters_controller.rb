class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      redirect_to fighters_path
    else
      render :new
    end
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :health, :power)
  end
end
