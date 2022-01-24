# frozen_string_literal: true

require 'http'

RSpec.describe Http do
  subject { described_class.new(base_url: 'https://simpledebit.gocardless.io/') }

  describe '#fetch' do
    it 'fetches a correct response from knwon API' do
      expect(subject.fetch(endpoint: '/health_check')).to eq({ 'status' => 'ok' })
    end
  end
end
