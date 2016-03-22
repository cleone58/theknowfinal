module Seatgeek

  class Venue < Base
    attr_reader :api_venue_id, :name, :timezone, :city, :state_prov, :postal_zip_code, :country, :tickets_url
    attr_accessor :address, :extended_address, :latitude, :longitude

    def initialize(attributes)
      @api_venue_id = attributes['id']
      @name = attributes["name"]
      @timezone = attributes["timezone"]
      @address = attributes["address"]
      @city = attributes["city"]
      @state_prov = attributes["state"]
      @postal_zip_code = attributes["postal_code"]
      @extended_address = attributes["address"] + ", " + attributes["city"] + ", " + attributes["state"] + ", " + attributes["postal_code"] + ", " + attributes["country"]
      @country = attributes["country"]
      @tickets_url = attributes['url']
      @latitude = attributes["location"]["lat"].to_f
      @longitude = attributes["location"]["lon"].to_f
    end

    def self.venue_search(keywords)
      response = get("/venues?q=#{keywords.to_s.gsub(' ','-')}&per_page=1000&page=1&client_id=#{ENV['seatgeek_id']}&client_secret=#{ENV['seatgeek_secret']}")

      response["venues"].map do |venue|
        new(venue)
      end
    end

    def self.venue_find(id)
      response = get("/venues?id=#{id}&client_id=#{ENV['seatgeek_id']}&client_secret=#{ENV['seatgeek_secret']}")
      new(response["venues"][0])
    end

    def self.to_h(venue)
      {
      api_venue_id: venue.api_venue_id,
      name: venue.name,
      timezone: venue.timezone,
      address: venue.address,
      extended_address: venue.extended_address,
      city: venue.city,
      state_prov: venue.state_prov,
      postal_zip_code: venue.postal_zip_code,
      country: venue.country,
      tickets_url: venue.tickets_url,
      latitude: venue.latitude,
      longitude: venue.longitude
      }
    end
  end

end
