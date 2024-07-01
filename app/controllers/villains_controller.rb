class VillainsController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @villains = Villain.where('LOWER(name) LIKE ?', query).page(params[:page]).per(10)
    else
      @villains = Villain.page(params[:page]).per(10)
    end
  end

  def show
    @villain = Villain.find(params[:id])
  end
end
