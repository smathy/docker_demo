json.array!(@foos) do |foo|
  json.extract! foo, :id, :name
  json.url foo_url(foo, format: :json)
end
