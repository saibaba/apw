json.array!(@transports) do |transport|
  json.extract! transport, :name, :share
  json.url transport_url(transport, format: :json)
end
