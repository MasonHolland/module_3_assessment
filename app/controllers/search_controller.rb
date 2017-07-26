class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")
    response = conn.get
    parsed = JSON.parse(response.body)
    @stores = parsed["stores"]
    flash[:success] = "#{parsed["total"]} Total Stores"
  end
end
