module Yotpo
  module Unsubscriber
    def self.included(base)
      base.
        define_endpoint(:create_unsubscribers, 'apps/{app_key}/unsubscribers/mass_create', method: :post).
        define_endpoint(:get_unsubscribers, 'apps/{app_key}/unsubscribers', method: :get).
        define_endpoint(:destroy_unsubscribers, 'apps/{app_key}/unsubscribers/mass_delete', method: :delete)
    end
  end
end
