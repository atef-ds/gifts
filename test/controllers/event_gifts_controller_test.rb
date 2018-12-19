require 'test_helper'

class EventGiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_gift = event_gifts(:one)
  end

  test "should get index" do
    get event_gifts_url
    assert_response :success
  end

  test "should get new" do
    get new_event_gift_url
    assert_response :success
  end

  test "should create event_gift" do
    assert_difference('EventGift.count') do
      post event_gifts_url, params: { event_gift: { price: @event_gift.price, title: @event_gift.title } }
    end

    assert_redirected_to event_gift_url(EventGift.last)
  end

  test "should show event_gift" do
    get event_gift_url(@event_gift)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_gift_url(@event_gift)
    assert_response :success
  end

  test "should update event_gift" do
    patch event_gift_url(@event_gift), params: { event_gift: { price: @event_gift.price, title: @event_gift.title } }
    assert_redirected_to event_gift_url(@event_gift)
  end

  test "should destroy event_gift" do
    assert_difference('EventGift.count', -1) do
      delete event_gift_url(@event_gift)
    end

    assert_redirected_to event_gifts_url
  end
end
