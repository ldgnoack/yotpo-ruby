module Yotpo
  module OrderFulfillment
    def self.included(base)
      base.
        define_endpoint(:get_order_fulfillments,
                        'core/v3/stores/{app_key}/orders/{yotpo_order_id}/fulfillments').

        define_endpoint(:find_order_fulfillment,
                        'core/v3/stores/{app_key}/orders/{yotpo_order_id}/fulfillments/{yotpo_fulfillment_id}').

        define_endpoint(:create_order_fulfillment,
                        'core/v3/stores/{app_key}/orders/{yotpo_order_id}/fulfillments',
                        method: :post).

        define_endpoint(:update_order_fulfillment,
                        'core/v3/stores/{app_key}/orders/{yotpo_order_id}/fulfillments/{yotpo_fulfillment_id}',
                        method: :patch)
    end
  end
end
