require "spec_helper"
require 'urban_dict_api/word'
RSpec.describe UrbanDictApi do
  it "has a version number" do
    expect(UrbanDictApi::VERSION).not_to be nil
  end

  describe "searching valid word" do
    class DummyClass
    end

    before do
      @dummy_class = DummyClass.new
      @dummy_class.extend(UrbanDictApi)
      word = UrbanDictApi::Word.new
      allow(UrbanDictApi::ApiHelper).to receive(:fetch_word).and_return(word)
    end

    it 'should return a word model' do
      query_word = "value"
      return_word = @dummy_class.query(query_word)
      expect(return_word).to be_truthy
    end
  end
end
