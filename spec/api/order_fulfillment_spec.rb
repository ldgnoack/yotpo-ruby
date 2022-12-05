require 'helper'

describe Yotpo::OrderFulfillment do
  include_context 'endpoints'

  before(:all) do
    @order_fulfillment_payload = {
      external_id: '3000',
      fulfillment_date: '2022-10-29T17:01:34Z',
      status: 'success',
      fulfilled_items: [{ external_product_id: '116072', quantity: 1 }],
    }.freeze
  end

  before(:all) { @base_params = @base_params.merge(yotpo_order_id: '4091816088') }

  describe '.find_order_fulfillment' do
    before(:all) do
      VCR.use_cassette('find_order_fulfillment') do
        @response = Yotpo.find_order_fulfillment(@base_params.merge(yotpo_fulfillment_id: '1685681195'))
      end
    end

    it { is_expected.to be_a ::Hashie::Mash }
    it { expect(subject.fulfillment).to be_a ::Hashie::Mash }
  end

  describe '.get_order_fulfillments' do
    before(:all) do
      VCR.use_cassette('get_order_fulfillments') do
        @response = Yotpo.get_order_fulfillments(@base_params)
      end
    end

    it { is_expected.to be_a ::Hashie::Mash }
    it { expect(subject.fulfillments).to be_a ::Hashie::Array }
  end

  describe '.create_order_fulfillment' do
    before(:all) do
      params = @base_params.merge(fulfillment: @order_fulfillment_payload)
      VCR.use_cassette('create_order_fulfillment') do
        @response = Yotpo.create_order_fulfillment(params)
      end
    end

    it { is_expected.to be_a ::Hashie::Mash }
    it { expect(subject.dig(:fulfillment, :yotpo_id)).to be_an Integer }
  end

  describe '.update_order_fulfillment' do
    before(:all) do
      params = @base_params.merge(yotpo_fulfillment_id: '1685681195', fulfillment: @order_fulfillment_payload)
      VCR.use_cassette('update_order_fulfillment') do
        @response = Yotpo.update_order_fulfillment(params)
      end
    end

    subject { @response }
    it { expect(subject.status).to eq 200 }
    it { expect(subject.body).to be_empty }
  end
end
