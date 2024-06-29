class ShortsController < ApplicationController
  def index
    @shorts = Short.page(params[:page]).per(10)
  end

  def show
    @short = Short.find(params[:id])
  end
end
