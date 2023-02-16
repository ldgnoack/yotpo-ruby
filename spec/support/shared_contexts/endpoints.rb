shared_context 'endpoints' do
  let(:described_class) { Yotpo }

  subject { @response.body }

  before(:all) do
    @base_params = {
      app_key: 'foo',
      utoken: 'baz',
    }.freeze
  end

  let(:base_params) { @base_params }
end
