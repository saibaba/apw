json.array!(@customers) do |customer|
  json.extract! customer, :name
  json.url customer_url(customer, format: :json)
end
