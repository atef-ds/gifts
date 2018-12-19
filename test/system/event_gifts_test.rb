require "application_system_test_case"

class EventGiftsTest < ApplicationSystemTestCase
  setup do
    @event_gift = event_gifts(:one)
  end

  test "visiting the index" do
    visit event_gifts_url
    assert_selector "h1", text: "Event Gifts"
  end

  test "creating a Event gift" do
    visit event_gifts_url
    click_on "New Event Gift"

    fill_in "Price", with: @event_gift.price
    fill_in "Title", with: @event_gift.title
    click_on "Create Event gift"

    assert_text "Event gift was successfully created"
    click_on "Back"
  end

  test "updating a Event gift" do
    visit event_gifts_url
    click_on "Edit", match: :first

    fill_in "Price", with: @event_gift.price
    fill_in "Title", with: @event_gift.title
    click_on "Update Event gift"

    assert_text "Event gift was successfully updated"
    click_on "Back"
  end

  test "destroying a Event gift" do
    visit event_gifts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event gift was successfully destroyed"
  end
end
