class Station
  attr_reader :name
  
  def initialize(data)
    @name = data[:station_name]
  end

  def self.find_by_zip(zip)
    raw_data = NrelService.find_by_zip(zip)
    raw_data.map {|raw_data| Station.new(raw_data)}
  end
end
