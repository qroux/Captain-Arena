class FightsController < ApplicationController
  def index
    @fights = Fight.all
  end

  def show
    @fight = Fight.find(params[:id])
    @player = @fight.player
    @opponent = @fight.opponent
    @player_turns = @fight.player_turns
    @opponent_turns = @fight.opponent_turns

    if @player_turns.empty?
      until @player_turns.sum >= @opponent.health || @opponent_turns.sum >= @player.health
        @player_turns << (@player.power * rand(1.0..2.0)).round
        break if @player_turns.sum >= @opponent.health

        @opponent_turns << (@opponent.power * rand(1.0..2.0)).round
      end
      @fight.save
    end

    (@opponent.health - @player_turns.sum).positive? ? @winner = @opponent : @winner = @player
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
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  def arena
    @fight = Fight.find(params[:id])
  end

  private

  def fight_params
    params.require(:fight).permit(:player, :opponent)
  end
end
