require 'test_helper'

class VenuesControllerTest < ActionController::TestCase
  setup do
    @venue = venues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue" do
    assert_difference('Venue.count') do
      post :create, venue: { address: @venue.address, api_venue_id: @venue.api_venue_id, city: @venue.city, country: @venue.country, extended_address: @venue.extended_address, latitude: @venue.latitude, longitude: @venue.longitude, name: @venue.name, postal_zip_code: @venue.postal_zip_code, state_prov: @venue.state_prov, tickets_url: @venue.tickets_url, timezone: @venue.timezone }
    end

    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should show venue" do
    get :show, id: @venue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venue
    assert_response :success
  end

  test "should update venue" do
    patch :update, id: @venue, venue: { address: @venue.address, api_venue_id: @venue.api_venue_id, city: @venue.city, country: @venue.country, extended_address: @venue.extended_address, latitude: @venue.latitude, longitude: @venue.longitude, name: @venue.name, postal_zip_code: @venue.postal_zip_code, state_prov: @venue.state_prov, tickets_url: @venue.tickets_url, timezone: @venue.timezone }
    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should destroy venue" do
    assert_difference('Venue.count', -1) do
      delete :destroy, id: @venue
    end

    assert_redirected_to venues_path
  end
end
