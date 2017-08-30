RSpec.describe NrelService, :type => :service do
  describe "class methods" do
    it ".find_by_zip returns data for 10 stations" do
      expect(NrelService.find_by_zip(80203)).to be_a(Array)
      expect(NrelService.find_by_zip(80203).count).to eq(10)
      expect(NrelService.find_by_zip(80203).first).to be_a(Station)
    end
  end
end
