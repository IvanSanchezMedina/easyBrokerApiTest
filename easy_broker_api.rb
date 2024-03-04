require 'uri'
require 'net/http'
require 'json'

class EasyBrokerAPI
    # Endpoint
  BASE_URL = "https://api.stagingeb.com/v1/"

  def initialize(auth_token)
    @auth_token = auth_token
  end

  def fetch_properties
    # Consulta api EasyBrokerAPI
    url = URI(BASE_URL + "properties")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["X-Authorization"] = @auth_token

    response = http.request(request)

    if response.code == '200'
        # Parsear  response to Json
      JSON.parse(response.body)["content"]
    else
      raise "Error fetching properties: #{response.code} - #{response.message}"
    end
  end
end
