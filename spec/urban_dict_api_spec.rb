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

    let(:word_no_result) { UrbanDictApi::Word.new { @value = 'value' } }
    let(:response_no_result)  do 
      { tags: [], definition: [], result_type: 'no_results' }
    end

    let(:word_has_result) do
      UrbanDictApi::Word.new do
        @value = 'value'
        @tags = ['tag1']
        @definitions = ['definition1']
      end
    end
    let(:response_has_result)  do 
      { tags: ['tag1'], definitions: ['definition1'], result_type: 'exact' }
    end

    context 'no result' do
      before do
        dummy_class.extend(UrbanDictApi)
        allow(UrbanDictApi::ApiHelper).to receive(:fetch_word).and_return(response_no_result)
      end

      it 'should return a proper response' do
        query_word = 'value'
        return_word = dummy_class.query(query_word)
        expect(return_word.value).to eq(word_no_result.value)
      end
    end

    context 'has results' do
      before do
        dummy_class.extend(UrbanDictApi)
        allow(UrbanDictApi::ApiHelper).to receive(:fetch_word).and_return(response_has_result)
      end

      it 'should return a proper response' do
        query_word = 'value'
        return_word = dummy_class.query(query_word)
        puts word_has_result.value
        expect(return_word.value).to eq(word_has_result.value)
        expect(return_word.tags).to eq(word_has_result.tags)
        expect(return_word.definitions).to eq(word_has_result.definitions)
      end
    end
  end
end
