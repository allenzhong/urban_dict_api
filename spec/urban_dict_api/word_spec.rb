require 'spec_helper'
require 'urban_dict_api/word'

RSpec.describe UrbanDictApi::Word do
  describe 'Word#Attributes' do
    let(:word) { UrbanDictApi::Word.new { @value = 'value' } }

    it 'should have value' do
      expect(word.value).to eq('value')
    end

    it 'should have tags' do
      expect(word).to have_attributes(tags: [])
    end

    it 'should have definitions' do
      expect(word).to have_attributes(definitions: [])
    end
  end
end
