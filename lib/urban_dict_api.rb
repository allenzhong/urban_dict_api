require "urban_dict_api/version"
require "urban_dict_api/api_helper"

module UrbanDictApi
  def query(word)
    ApiHelper.fetch_word(word)
  end
end
