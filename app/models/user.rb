class User
  include MongoMapper::Document

  key :name, String
  key :screen_name, String

end
