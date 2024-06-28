class ShortsController < ApplicationController
    def index
      @shorts = ShortsService.fetch_shorts  # From Shorts API, get a shorts list
    rescue StandardError => e
      flash[:error] = "Error fetching shorts: #{e.message}"
      @shorts = []  # if error
    end
  end
  