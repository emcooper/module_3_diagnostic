RSpec.describe Station, :type => :model do
  describe "class methods" do
    it ".find_by_zip returns array of 10 stations" do
      expect(Station.find_by_zip(80203)).to be_a(Array)
      expect(Station.find_by_zip(80203).count).to eq(10)
      expect(Station.find_by_zip(80203).first).to be_a(Station)
    end
  end
end
