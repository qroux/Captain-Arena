class FightsController < ApplicationController
  def index
    @fights = Fight.all
  end

  def new
    @fight = Fight.new
    @fighters = Fighter.all
  end

  def create
  end
end
