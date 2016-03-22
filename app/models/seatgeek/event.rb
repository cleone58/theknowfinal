module Seatgeek

  class Event < Base
    attr_accessor :title, :category, :image_url, :tickets_url, :datetime_local, :venue_name, :api_venue_id, :city_name, :state_prov, :country_name, :avg_price, :api_event_id, :performers_id, :performers_name, :performers

    def initialize(attributes)
      @api_event_id = attributes["id"]
      @category = attributes["type"]
      @image_url = attributes['performers'][0]['image']
      @tickets_url = attributes['performers'][0]['url']
      @title = attributes["title"]
      @datetime_local = attributes["datetime_local"]
      @venue_name = attributes["venue"]["name"]
      @api_venue_id = attributes["venue"]["id"]
      @city_name = attributes["venue"]["city"]
      @state_prov = attributes["venue"]["state"]
      @country_name = attributes["venue"]["country"]
      @avg_price = attributes["stats"]["average_price"]
      @performers = attributes['performers']  #array
    end

    def self.event_search(keywords)
      response = get("/events?q=#{keywords.to_s.gsub(' ','-')}&per_page=1000&page=1&client_id=#{ENV['seatgeek_id']}&client_secret=#{ENV['seatgeek_secret']}")

      if response.empty?
        render 'index'
      else
        response["events"].map do |event|
          new(event)
        end
      end
    end

    # def self.event_search_geolocation(keywords,latitude,longitude)
    #   response = get("/events?q=#{keywords.to_s.gsub(' ','-')}&per_page=1000&page=1&lat=#{latitude}&lon=#{longitude}&datetime_utc.gte=#{year}-#{month_start}-01&datetime_utc.lt=#{year}-#{month_end}-#{Seatgeek::Event.end_of_month(month_end)}&client_id=#{ENV['seatgeek_id']}&client_secret=#{ENV['seatgeek_secret']}")
    #
    #   if response.empty?
    #     render 'index'
    #   else
    #     response["events"].map do |event|
    #       new(event)
    #     end
    #   end
    # end


    def self.end_of_month(month)
      days_in_month = [nil, "31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"]
      days_in_month[month.to_i]
    end

    def self.event_find(id)
      #Sends http request and returns json hash as response.
      response = get("/events?id=#{id}&client_id=#{ENV['seatgeek_id']}&client_secret=#{ENV['seatgeek_secret']}")
      #Creates new event object from returned events/json hash
      new(response["events"][0])
    end

    def self.event_performers_ids(event_performers_attribute)
      event_performers_attribute.map do |performer|
        performer["id"]
      end
    end

    def self.event_performers_names(event_performers_attribute)
      event_performers_attribute.map do |performer|
        performer["name"]
      end
    end

    def self.to_h(event)
      {
      api_event_id: event.api_event_id,
      category: event.category,
      image_url: event.image_url,
      tickets_url: event.tickets_url,
      title: event.title,
      datetime_local: event.datetime_local,
      venue_name: event.venue_name,
      api_venue_id: event.api_venue_id,
      city_name: event.city_name,
      state_prov: event.state_prov,
      country_name: event.country_name,
      avg_price: event.avg_price
      }
    end

  end
end
