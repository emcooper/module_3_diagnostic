class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :access_time,
              :distance


  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @fuel_type = data[:fuel_type_code]
    @access_time = data[:access_days_time]
    @distance = data[:distance]
  end

  def self.find_by_zip(zip)
    raw_data = NrelService.find_by_zip(zip)
    raw_data.map {|raw_data| Station.new(raw_data)}
  end
end
