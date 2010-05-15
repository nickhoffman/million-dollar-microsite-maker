class CanPagesController < ApplicationController
  def search
    @companies = CanPages.search :loc => params[:location], :key => params[:topic]
  end
end
