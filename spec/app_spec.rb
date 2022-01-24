# frozen_string_literal: true

require 'app'

RSpec.describe App do
  subject { described_class.new('Name') }

  describe '#greet' do
    it do
      expect(subject.greet).to eq('Hello world')
    end
  end
end
