class ApplicationController < ActionController::Base
    before_action :set_genders
  
    private
  
    def set_genders
      @genders = ['Male', 'Female', 'Other']
    end
  end
  