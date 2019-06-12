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
        p_damage = ((@player.power + @fight.player_weapon.attack) * rand(1.0..@player.luck)).round
        o_resilience = (@fight.opponent_weapon.defense * rand(1.0..@player.luck)).round
        if o_resilience >= p_damage
          @player_turns << 0
        else
          @player_turns << (p_damage - o_resilience)
        end
        break if @player_turns.sum >= @opponent.health

        o_damage = ((@opponent.power + @fight.opponent_weapon.attack) * rand(1.0..@opponent.luck)).round
        p_resilience = (@fight.player_weapon.defense * rand(1.0..@player.luck)).round
        if p_resilience >= o_damage
          @opponent_turns << 0
        else
          @opponent_turns << (o_damage - p_resilience)
        end
      end
      @fight.save
    end

    (@opponent.health - @player_turns.sum).positive? ? @winner = @opponent : @winner = @player
  end

  def new
    @fight = Fight.new
    @fighters = Fighter.all
    @weapons = Weapon.all
  end

  def create
    # @fight = Fight.new(fight_params) doesn't work, type mismatch, expect id, receive integer or string
    @fight = Fight.new
    #fix simple_form bug when render :new
    @fighters = Fighter.all
    #fix simple_form bug when render :new
    @weapons = Weapon.all
    @fight.player = Fighter.find_by(id: fight_params[:player])
    @fight.player_weapon = Weapon.find_by(id: fight_params[:player_weapon])
    @fight.opponent = Fighter.find_by(id: fight_params[:opponent])
    @fight.opponent_weapon = Weapon.find_by(id: fight_params[:opponent_weapon])
    if @fight.save
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:player, :opponent, :player_weapon, :opponent_weapon)
  end
end
