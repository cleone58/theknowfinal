module Seatgeek

  class Base
    include HTTParty
    base_uri 'https://api.seatgeek.com/2'
  end

end
