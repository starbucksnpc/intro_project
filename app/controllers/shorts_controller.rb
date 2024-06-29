class ShortsController < ApplicationController
  def index
    @shorts = Short.all
  end

  def show
    @short = Short.find(params[:id])
  end
end
