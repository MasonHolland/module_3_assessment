class SearchController < ApplicationController
  def index
    parsed = StoreService.new(params[:search]).zip_search
    @stores = Stores.new(parsed).objectify
    @stores = Stores.paginate(:page => params[:page], :per_page => 10)
    flash[:success] = "#{parsed["total"]} Total Stores"
  end
end



# conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")
# response = conn.get
# parsed = JSON.parse(response.body)
# @stores = parsed["stores"]
