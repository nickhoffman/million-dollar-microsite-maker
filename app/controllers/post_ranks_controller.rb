class PostRanksController < ApplicationController
  def search
    @articles = PostRankSearcher.search_by_topic params[:topic]
  end
end
