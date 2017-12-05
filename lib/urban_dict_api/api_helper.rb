require 'rest-client'
module UrbanDictApi
  class ApiHelper
    API_URL = "http://api.urbandictionary.com/v0/define"
    PARAM = "term"

    def self.fetch_word(word = '')
      response = RestClient.get(API_URL, {params: {term: word}})
    end
  end
end