class MicrositesController < ApplicationController

  layout "microsite"
  
  def generate
    @location = "Toronto"
    @topic = "Dating"
  end
  
end
