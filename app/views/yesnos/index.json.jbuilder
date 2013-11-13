json.array!(@yesnos) do |yesno|
  json.extract! yesno, :name, :share
  json.url yesno_url(yesno, format: :json)
end
