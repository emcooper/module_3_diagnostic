class NrelService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(:url => 'https://developer.nrel.gov/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_by_zip
    response = @conn.get("api/alt-fuel-stations/v1/nearest.json?radius=6&location=80203&limit=10&format=JSON&api_key=#{ENV["NREL_Key"]}")
    JSON.parse(response.body, :symbolize_names => true)[:fuel_stations]
  end

  def self.find_by_zip(zip)
    NrelService.new(zip).find_by_zip
  end
end
