json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :title, :description, :displayUrl
  json.url keyword_url(keyword, format: :json)
end
