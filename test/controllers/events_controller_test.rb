require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { api_event_id: @event.api_event_id, api_venue_id: @event.api_venue_id, avg_price: @event.avg_price, category: @event.category, city_name: @event.city_name, country_name: @event.country_name, datetime_local: @event.datetime_local, image_url: @event.image_url, state_prov: @event.state_prov, tickets_url: @event.tickets_url, title: @event.title, venue_id: @event.venue_id, venue_name: @event.venue_name }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { api_event_id: @event.api_event_id, api_venue_id: @event.api_venue_id, avg_price: @event.avg_price, category: @event.category, city_name: @event.city_name, country_name: @event.country_name, datetime_local: @event.datetime_local, image_url: @event.image_url, state_prov: @event.state_prov, tickets_url: @event.tickets_url, title: @event.title, venue_id: @event.venue_id, venue_name: @event.venue_name }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
