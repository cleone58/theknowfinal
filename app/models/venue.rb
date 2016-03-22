class Venue < ActiveRecord::Base
  geocoded_by :extended_address
end
