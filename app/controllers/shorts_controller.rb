class ShortsController < ApplicationController
  def index
    @shorts = Short.all
  end
end
