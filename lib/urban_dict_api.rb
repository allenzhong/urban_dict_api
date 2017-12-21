require 'urban_dict_api/version'
require 'urban_dict_api/api_helper'
require 'byebug'
module UrbanDictApi
  def query(value)
    response = ApiHelper.fetch_word(value)
    word = UrbanDictApi::Word.new { @value = value }
    unless response[:result_type] == 'no_results'
      word.tags = response[:tags]
      word.definitions = response[:definitions]
    end
    word
  end
end
