json.array!(@windows) do |window|
  json.extract! window, :name, :share
  json.url window_url(window, format: :json)
end
