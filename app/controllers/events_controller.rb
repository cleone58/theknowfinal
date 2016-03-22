class EventsController < ApplicationController
  skip_before_action :require_login

  def home
    render :layout => 'home_layout'
  end

  def index

    if params[:search].blank?
      # flash[:alert] = "Your search is invalid. Please enter keywords, and search again."
      render 'index'
    else
      @events = Kaminari.paginate_array(Seatgeek::Event.event_search(params[:search],params[:start][:month],params[:end][:month],params[:year][:year])).page(params[:page]).per(18)
    end
  end

  def show
    @event = Seatgeek::Event.event_find(params[:id])
    create_from_seatgeek

    # if Event.exists?(api_event_id: params[:id])
    #   @event = Event.find_by(api_event_id: params[:id])
    # else
    #   @event = Seatgeek::Event.event_find(params[:id])
    # end

    @performers = Seatgeek::Event.event_performers_names(@event.performers)
  end

  def new

  end

  def create
    create_from_seatgeek
  end

  def bookmark
    @bookmark = Seatgeek::Event.event_find(params[:id])
  end

  private
    def search_params
      params.require(:event).permit(:search, :page, :id, :start_month[:month], :end_month[:month], :year[:year] )
    end

    def event_params
      params.require(:event).permit(:api_event_id, :user_id, :title, :category, :image_url, :api_venue_id, :venue, :venue_name, :tickets_url, :datetime_local, :city_name, :state_prov, :country_name, :avg_price)
    end

    def create_from_seatgeek
      event = Seatgeek::Event.to_h(@event)
      Event.create(event)

    end
end
