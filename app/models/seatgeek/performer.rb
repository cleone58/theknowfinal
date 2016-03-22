module Seatgeek

  class Performer < Base
    attr_reader :performer_id, :name, :category, :image_url, :has_upcoming_events, :tickets_url, :primary_genre

    def initialize(attributes)
      @api_performer_id = attributes["id"]
      @name = attributes["name"]
      @category = attributes["type"]
      @image_url = attributes["image"]
      @has_upcoming_events = attributes["has_upcoming_events"]
      @tickets_url = attributes["url"]
      @primary_genre = attributes["genres"]   #array
    end

    def self.performer_search(keywords)
      response = get("/performers?q=#{keywords.to_s.gsub(' ','-')}&client_id=#{ENV['seatgeek_id']}&client_secret=#{ENV['seatgeek_secret']}")

      response["performers"].map do |performer|
        new(performer)
      end
    end

    def self.performer_find(id)
      response = get("/performers?id=#{id}&client_id=#{ENV['seatgeek_id']}&client_secret=#{ENV['seatgeek_secret']}")
      new(response["performers"][0])
    end

    def self.performer_genre(primary_genre_attribute)
      primary_genre_attribute.map do |genre|
        if genre["primary"] == true
          genre["name"]
        end
      end
    end

    def self.to_h(performer)
      genre = Seatgeek::Performer.performer_genre(performer[0].primary_genre).compact!
      {
        api_performer_id: performer[0].performer_id,
        name: performer[0].name,
        category: performer[0].type,
        image_url: performer[0].image_url,
        has_upcoming_events: performer[0].has_upcoming_events,
        tickets_url: performer[0].tickets_url,
        primary_genre: genre[0]
      }
    end

  end

end
