class Venue < ActiveRecord::Base
  geocoded_by :extended_address

  def self.geocode(venue)
    venue_to_geocode = venue
    geocoded_venue = venue_to_geocode.geocode
    venue_to_geocode.update(latitude: geocoded_venue[0])
    venue_to_geocode.update(longitude: geocoded_venue[1])
    return venue
  end
end
