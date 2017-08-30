RSpec.feature "User searches stations by zipcode" do
  scenario "they are redirected to the results page with 10 results" do
    VCR.user_cassette('spec/cassettes/user_searches_by_zipcode') do

    end
  end
  scenario "they only see electric & propane stations" do
    VCR.user_cassette('spec/cassettes/user_searches_by_zipcode') do

    end
  end
  scenario "they see name, address, fuel type, distance and access times for each station" do
    VCR.user_cassette('spec/cassettes/user_searches_by_zipcode') do

    end
  end
end

As a user
When I visit "/"
And I fill in the search form with 80203
And I click "Locate"
Then I should be on page "/search" with parameters visible in the url
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
