class WatchlistDashboardController < ApplicationController
  before_action AOTokenFilter, only: [:index]
  before_action :authenticate_user!, PQUserFilter, only: [:preview]

  def index
  	update_page_title('Watchlist Preview')
    @questions = Pq.allocated_since(DateTime.now.at_beginning_of_day)
  end

  def preview
    index
    render 'index'
  end
end
