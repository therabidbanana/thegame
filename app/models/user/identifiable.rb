module User::Identifiable
  def self.included(base)
    base.class_eval do
      # Allow omniauth storage
      many :identities, :class_name => 'User::Identity', :default => []

      def self.create_with_omniauth(auth)
        user = User.new
        user.identities = []
        auth = {
          :provider => auth['provider'],
          :uid => auth['uid'],
          :info => auth['info']
        }
        user.identities << User::Identity.new(auth)
        user.save
        user
      end
    end
  end

  def provider
    identities.first.provider unless identities.blank?
  end

  def uid
    identities.first.uid unless identities.blank?
  end

  def remove_auth(provider)
    identities.delete_if{ |a| a.provider == provider.to_s}
  end


  # Fetch some oauth facebook info
  # def koala
    # @koala ||= Koala::Facebook::API.new(self.facebook_token)
  # end
end
