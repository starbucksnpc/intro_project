class VillainsController < ApplicationController
  def index
    @villains = Villain.all
  end

  def show
    @villain = Villain.find(params[:id])
  end
end
