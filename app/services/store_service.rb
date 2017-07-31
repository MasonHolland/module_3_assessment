class StoreService
  def self.zip_search(zip)
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,distance,city,phone&apiKey=#{ENV["best_buy_key"]}")
    response = conn.get
    JSON.parse(response.body)
  end
end
