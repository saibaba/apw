json.array!(@consumers) do |consumer|
  json.extract! consumer, :name, :share
  json.url consumer_url(consumer, format: :json)
end
