require 'rest-client'

access_token = File.read("../config/access_token.secret").strip()
access_pin = File.read("../config/access_pin.secret").strip()
device_id = File.read("../config/device_id.secret").strip()
structure_id = File.read("../config/structure_id.secret").strip()

NEST_API_URL_TEMP = "https://developer-api.nest.com/devices/thermostats/#{device_id}/target_temperature_f?auth=#{access_token}"
NEST_API_URL_STATUS = "https://developer-api.nest.com/structures/#{structure_id}/away?auth=#{access_token}"

target_temperature_f = '75'
desired_status = 'away' # Can be home or away

def get_current_temperature
  response = RestClient.get(NEST_API_URL_TEMP)
end

def set_temperature
  response = RestClient.put(NEST_API_URL_TEMP, target_temperature_f)
end

def set_status
  response = RestClient.put(NEST_API_URL_STATUS, desired_status)
end
