class SearchController < ApplicationController
  def index
    parsed = StoreService.zip_search(params[:search])
    @stores = Stores.new(parsed).objectify.paginate(:page => params[:page], :per_page => 10)
    flash[:success] = "#{parsed["total"]} Total Stores"
  end
end
