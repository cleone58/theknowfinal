class VenuesController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def index
  end

  def show
    if Venue.exists?(api_venue_id: params[:id])
      @venue = Venue.find_by(api_venue_id: params[:id])
    else
      venue = Seatgeek::Venue.venue_find(params[:id])
      create
      venue_to_update_lat_long = Venue.find_by(api_venue_id: params[:id])
      @venue = Venue.geocode(venue_to_update_lat_long)
    end
  end

  def create
    venue = Seatgeek::Venue.to_h(Seatgeek::Venue.venue_find(params[:id]))
    Venue.create(
      api_venue_id: venue[:api_venue_id],
      name: venue[:name],
      timezone: venue[:timezone],
      address: venue[:address],
      extended_address: venue[:extended_address],
      city: venue[:city],
      state_prov: venue[:state_prov],
      postal_zip_code: venue[:postal_zip_code],
      country: venue[:country],
      tickets_url: venue[:tickets_url],
      latitude: venue[:latitude],
      longitude: venue[:longitude]
      )
  end

  private
    def search_params
      params.require(:venue).permit(:id)
    end
end
