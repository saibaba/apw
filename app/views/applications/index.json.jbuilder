json.array!(@applications) do |application|
  json.extract! application, :customer_id, :name, :servers, :tiers, :style, :provider, :customization, :consumer, :consumption, :transport, :integration, :inhouse, :contracted, :criticality, :sensitivity, :regulatory, :constraint
  json.url application_url(application, format: :json)
end
