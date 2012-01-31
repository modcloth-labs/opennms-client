require 'json'
module OpenNMS
  class Client
    def initialize
    end
    def create
    end
    def update
    end
    def list
      `curl -u dev:dev -H "Accept: application/json" "http://192.168.38.3:8980/opennms/rest/outages/forNode/384" |python -mjson.tool`
    end
  end
end
