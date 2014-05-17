class Keyword
  include MongoMapper::Document
key :key, String
  key :title, String
  key :description, String
  key :displayUrl, String

end
