class VillainsController < ApplicationController
  before_action :set_genders, only: [:index, :show]
  before_action :set_villain, only: [:show]

  def index
    if params[:query].present? && params[:gender].present?
      query = "%#{params[:query].downcase}%"
      @villains = Villain.where('LOWER(name) LIKE ? AND LOWER(gender) = ?', query, params[:gender].downcase)
                         .distinct.page(params[:page]).per(10)
    elsif params[:query].present?
      query = "%#{params[:query].downcase}%"
      @villains = Villain.where('LOWER(name) LIKE ?', query).distinct.page(params[:page]).per(10)
    elsif params[:gender].present?
      @villains = Villain.where('LOWER(gender) = ?', params[:gender].downcase).distinct.page(params[:page]).per(10)
    else
      @villains = Villain.distinct.page(params[:page]).per(10)
    end
  end

  def show

  end

  private

  def set_genders
    @genders = ['male', 'female', 'other']
  end

  def set_villain
    @villain = Villain.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to villains_path, alert: "Villain not found."
  end
end
