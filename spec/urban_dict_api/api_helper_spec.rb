require 'spec_helper'

RSpec.describe UrbanDictApi::ApiHelper do
  before do
    @valide_response = "{tags: [], result_type: 'exact', list: []}"
    @url = "http://api.urbandictionary.com/v0/define?term=" 
    @word = "value"
    @stub = stub_request(:get, "#{@url}#{@word}").
      to_return(body: @valide_response)
  end

  it 'should have a correct request' do
    UrbanDictApi::ApiHelper.fetch_word(@word)
    expect(a_request(:get, "#{@url}").with(query: {term: @word})).to have_been_requested
  end
end