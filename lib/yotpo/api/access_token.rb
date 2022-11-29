module Yotpo
  module AccessToken
    def self.included(base)
      base.define_endpoint(:generate_utoken, 'core/v3/stores/{app_key}/access_tokens', method: :post)
    end
  end
end
