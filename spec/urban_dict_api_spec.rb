require 'spec_helper'
require 'urban_dict_api/word'
RSpec.describe UrbanDictApi do
  it 'has a version number' do
    expect(UrbanDictApi::VERSION).not_to be nil
  end

  describe 'searching valid word' do
    class DummyClass
    end

    let(:dummy_class) do
      DummyClass.new
    end

    let(:word) { UrbanDictApi::Word.new { @value = 'value' } }

    before do
      dummy_class.extend(UrbanDictApi)
      allow(UrbanDictApi::ApiHelper).to receive(:fetch_word).and_return(word)
    end

    it 'should return a word model' do
      query_word = 'value'
      return_word = dummy_class.query(query_word)
      expect(return_word).to eq(word)
    end
  end
end
