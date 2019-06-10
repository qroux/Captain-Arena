class FightsController < ApplicationController
  def index
    @fights = Fight.all
  end

  def new
    @fight = Fight.new
    @fighters = Fighter.all
  end

  def create
    # @fight = Fight.new(fight_params) doesn't work, type mismatch, expect id, receive integer or string
    @fight = Fight.new
    @fight.player = Fighter.find_by(id: fight_params[:player])
    @fight.opponent = Fighter.find_by(id: fight_params[:opponent])
    if @fight.save
      redirect_to fights_path
    else
      render :new
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:player, :opponent)
  end
end
