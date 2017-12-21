require 'rest-client'
require 'json'

module UrbanDictApi
  class ApiHelper
    API_URL = 'http://api.urbandictionary.com/v0/define'
    PARAM = 'term'

    def self.fetch_word(word = '')
      response = RestClient.get(API_URL, {params: {term: word}})
      json_body = JSON.parse(response.body)
      json_body
    end
  end
end