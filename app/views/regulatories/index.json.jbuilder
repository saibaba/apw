json.array!(@regulatories) do |regulatory|
  json.extract! regulatory, :name, :share
  json.url regulatory_url(regulatory, format: :json)
end
