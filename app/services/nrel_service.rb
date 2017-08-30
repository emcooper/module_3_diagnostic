class NrelService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(:url => 'https://developer.nrel.gov/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end


  def find_by_zip
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.format?location=#{@zip}")
    JSON.parse(response.body, :symbolize_names => true)
  end


  def self.find_by_zip(zip)
    NrelService.new(zip).find_by_zip
  end
end
