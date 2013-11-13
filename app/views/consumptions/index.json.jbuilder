json.array!(@consumptions) do |consumption|
  json.extract! consumption, :name, :share
  json.url consumption_url(consumption, format: :json)
end
