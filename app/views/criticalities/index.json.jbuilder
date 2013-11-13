json.array!(@criticalities) do |criticality|
  json.extract! criticality, :name, :share
  json.url criticality_url(criticality, format: :json)
end
