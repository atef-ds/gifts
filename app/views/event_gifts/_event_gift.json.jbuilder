json.extract! event_gift, :id, :title, :price, :created_at, :updated_at
json.url event_gift_url(event_gift, format: :json)
