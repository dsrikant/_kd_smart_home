require 'rest-client'

access_token = File.read("../config/access_token.secret").strip()
access_pin = File.read("../config/access_pin.secret").strip()
device_id = File.read("../config/device_id.secret").strip()

NEST_API_URL_GET_TEMP = "https://developer-api.nest.com/devices/thermostats/#{device_id}/target_temperature_f?auth=#{access_token}"

response = RestClient.get(NEST_API_URL_GET_TEMP)

puts response
