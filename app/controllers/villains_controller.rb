class VillainsController < ApplicationController
    def index
      @villains = VillainsService.fetch_villains  # From Villains API, get a villains list
    rescue StandardError => e
      flash[:error] = "Error fetching villains: #{e.message}"
      @villains = []  # if error
    end
  end