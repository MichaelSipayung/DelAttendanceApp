# frozen_string_literal: true
require 'net/http'
require 'json'
require 'uri'
class AuthenticationService
  API_ENDPOINT = 'https://cis.del.ac.id/api/authentication/do-auth'
  def authenticate(username, password)
    uri = URI.parse(API_ENDPOINT)
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(
      'username' => username,
      'password' => password
    )
    req_options = {
      use_ssl: uri.scheme == 'https'
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    JSON.parse(response.body)
  end
end
