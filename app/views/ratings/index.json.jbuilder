json.array!(@ratings) do |rating|
  json.extract! rating, :name, :share
  json.url rating_url(rating, format: :json)
end
