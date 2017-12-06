require 'spec_helper'

RSpec.describe UrbanDictApi::ApiHelper do
  before do
    @valide_response = "{\"tags\": [\"value\"], \"result_type\": \"exact\", \"list\": [{\"definition\": \"def\", \"word\": \"value\"}]}"   
    @url = "http://api.urbandictionary.com/v0/define?term=" 
    @word = "value"
    @stub = stub_request(:get, "#{@url}#{@word}").
      to_return(body: @valide_response)
  end

  it 'should have a correct request' do
    UrbanDictApi::ApiHelper.fetch_word(@word)
    expect(a_request(:get, "#{@url}").with(query: {term: @word})).to have_been_requested
  end

  it 'should request and response correctly' do
    response = UrbanDictApi::ApiHelper.fetch_word(@word)
    expect(response['tags'].length).to eq(1)
    expect(response['result_type']).to eq('exact')
    expect(response['list'].length).to eq(1)
    expect(response['list'][0]['word']).to eq('value')
  end
end