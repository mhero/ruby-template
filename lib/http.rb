# frozen_string_literal: true

require 'json'
require 'faraday'

class Http
  DEFAULT_TIMEOUT = 3 # seconds
  DEFAULT_BASE_URL = 'https://simpledebit.gocardless.io/'

  def initialize(base_url: nil)
    @connection = Faraday.new(
      url: base_url || DEFAULT_BASE_URL,
      headers: { 'Content-Type' => 'application/json' },
      request: { timeout: DEFAULT_TIMEOUT }
    ) do |conn|
      conn.adapter Faraday.default_adapter
    end
  end

  def fetch(endpoint:)
    begin
      response = @connection.get(endpoint)
    rescue Faraday::TimeoutError
      puts 'Timeout error'
    end
    parsed_response(response)
  end

  private

  def parsed_response(response)
    JSON.parse(response.body)
  rescue JSON::ParserError
    puts "Something went wrong #{response.body}"
    {}
  end
end
