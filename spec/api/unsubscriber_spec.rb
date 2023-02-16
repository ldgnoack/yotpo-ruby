require 'helper'

describe Yotpo::Unsubscriber do
  include_context 'endpoints'

  let(:email_addresses) { ['ben@example.com', 'george@example.com'] }
  let(:payload) do
    {
      email_list: { '1' => email_addresses },
      async: false,
      validate_data: false,
    }
  end

  shared_examples 'unsubscribers standard response' do
    it { is_expected.to be_a ::Hashie::Mash }
    it { expect(subject.unsubscribers.map(&:user_email)).to include(*email_addresses) }
  end

  describe '.create_unsubscribers' do
    subject do
      VCR.use_cassette('create_unsubscribers') do
        Yotpo.create_unsubscribers(base_params.merge(payload)).body
      end
    end

    include_examples 'unsubscribers standard response'
  end

  describe '.get_unsubscribers' do
    subject do
      VCR.use_cassette('get_unsubscribers') do
        Yotpo.get_unsubscribers(base_params).body
      end
    end

    include_examples 'unsubscribers standard response'
  end

  describe '.destroy_unsubscribers' do
    subject do
      VCR.use_cassette('destroy_unsubscribers') do
        Yotpo.destroy_unsubscribers(base_params.merge(payload)).body
      end
    end

    include_examples 'unsubscribers standard response'
  end
end
