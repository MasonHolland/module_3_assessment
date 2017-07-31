class StoreService
  attr_reader :zip
  def initialize(zip)
    @zip = zip
  end

  def zip_search
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,distance,phone&apiKey=#{ENV["best_buy_key"]}")
    response = conn.get
    JSON.parse(response.body)
  end
end
