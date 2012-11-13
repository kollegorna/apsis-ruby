#require "apsis/version"

class Apsis
  ApsisError = Class.new(StandardError)

  def initialize(api_key = nil, default_parameters = {})
    @api_key = api_key || ENV['APSIS_API_KEY']

    @conn = Faraday.new(
      url:      'https://se.api.anpdm.com/v1/',
      ssl:      { verify: false },
      headers:  { accept: 'application/json' })
    @conn.basic_auth(@api_key, '')
  end

  def call(endpoint, params)
    response = @conn.post do |req|
      req.url endpoint
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
    unless response.status == 200
      raise ApsisError.new("Apsis API Error: #{response.body} (status code #{response.status})")
    end
    response.body
  end

  def create_subscribers(mailinglist_id, subscribers = [])
    call("subscribers/mailinglist/#{mailinglist_id}/queue", subscribers)
  end
end
