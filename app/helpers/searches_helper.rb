require 'addressable/uri'

module SearchesHelper
  API_KEY = "AIzaSyB53uQVbh2_6dNpi6XTtsLb2pCeK31gFEc"
  
  def lat_lng(address)
    geo_address = Addressable::URI.new(
    :scheme => "http",
    :host => "maps.googleapis.com",
    :path => "maps/api/geocode/json",
    :query_values => {:address => address, :sensor => false}
    ).to_s

    lat_lng_response = RestClient.get(geo_address)
    lat_lng_JSON = JSON.parse(lat_lng_response)
    lat_lng = lat_lng_JSON["results"].first["geometry"]["location"]
    lat = lat_lng["lat"].to_s
    lng = lat_lng["lng"].to_s
    "#{lat},#{lng}"
  end

  def find_nearby_places(address, subject, radius)
   places_address = Addressable::URI.new(
     :scheme => "https",
     :host => "maps.googleapis.com",
     :path => "maps/api/place/nearbysearch/json",
     :query_values => {
       :key => API_KEY,
       :location => lat_lng(address),
       :radius => radius,
       :sensor => false,
       :keyword => subject
      }
    ).to_s
    places_response = RestClient.get(places_address)
    places_JSON = JSON.parse(places_response)
  end

   def find_nearby_places_lat_long(address, subject, radius)
     places_JSON = find_nearby_places(address, subject, radius)
     places_JSON["results"].map do |result|
       lat_long_hash = result["geometry"]["location"]
       "#{lat_long_hash["lat"]},#{lat_long_hash["lng"]}"
     end
   end

   def find_nearby_places_by_name(address, subject, radius)
     places_JSON = find_nearby_places(address, subject, radius)
     places_JSON["results"].map { |result| result["name"] }
   end


  def route (origin, destination)
   direction_address = Addressable::URI.new(
     :scheme => "https",
     :host => "maps.googleapis.com",
     :path => "maps/api/directions/json",
     :query_values => {
       :origin => origin,
       :destination => destination,
       #:mode => "walking",
       :sensor => false
      }
    ).to_s
    direction_response = RestClient.get(direction_address)
    direction_JSON = JSON.parse(direction_response)
    direction_JSON 
  end
end
