class User
  class Identity
    include MongoMapper::EmbeddedDocument

    key :provider, String
    key :uid, String
    key :info, Hash

    def email
      info['email'] || ''
    end
    def name
      info['name'] || ''
    end

  end
end
