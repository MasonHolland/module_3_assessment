class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def zip_search_api_call(zip)
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")
    response = conn.get
    JSON.parse(response.body)
  end
end
