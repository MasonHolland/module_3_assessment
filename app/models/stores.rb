class Stores
  attr_reader :details
  def initialize(parsed_json)
    @parsed = parsed_json["stores"]
    @details = []
  end

  def objectify
    @details = @parsed.map do |store|
      store
    end
  end
end
