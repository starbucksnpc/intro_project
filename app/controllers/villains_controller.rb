class VillainsController < ApplicationController
  def index
    @villains = Villain.page(params[:page]).per(10)
  end

  def show
    @villain = Villain.find(params[:id])
  end
end
