require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'json'

describe "OpennmsClient" do
  it "parses simple JSON" do
   	json = %Q([{" one":" two", " three":" four", " five":" six", " seven":" eight"}])
    JSON.parse(json).is_a?(Array).should be_true
    puts JSON.parse(json)
  end
  it "can talk to the OpenNMS ReST interface" do
    base_url = "http://OpenNMS.ModCloth.PVT:8980/opennms/rest"
    url = "#{base_url}&query=#{URI.encode(query)}&results=#{results}&start=#{start}"
    url = "#{base_url}?limit=0"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body

    # we convert the returned JSON data to native Ruby
    # data structure - a hash
    result = JSON.parse(data)

    # if the hash has 'Error' as a key, we raise an error
    if result.has_key? 'Error'
       raise "web service error"
    end
    return result
  end
end
