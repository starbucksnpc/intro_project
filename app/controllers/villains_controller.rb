class VillainsController < ApplicationController
  before_action :set_genders, only: [:index]

  def index
    @genders = ['Male', 'Female', 'Other'] # Define the genders for the dropdown

    if params[:query].present? && params[:gender].present?
      query = "%#{params[:query].downcase}%"
      @villains = Villain.where('LOWER(name) LIKE ? AND gender = ?', query, params[:gender])
                         .distinct.page(params[:page]).per(10)
    elsif params[:query].present?
      query = "%#{params[:query].downcase}%"
      @villains = Villain.where('LOWER(name) LIKE ?', query).distinct.page(params[:page]).per(10)
    elsif params[:gender].present?
      @villains = Villain.where(gender: params[:gender]).distinct.page(params[:page]).per(10)
    else
      @villains = Villain.distinct.page(params[:page]).per(10)
    end
  end

  private

  def set_genders
    @genders = ['male', 'female', 'other']
  end
end
