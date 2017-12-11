require 'spec_helper'
require 'urban_dict_api/word'

RSpec.describe UrbanDictApi::Word do
  describe 'Word' do
    let(:word) { UrbanDictApi::Word.new }
    
    it 'should have tags' do
      expect(word).to have_attributes(tags: [])
    end 

    it 'should have definitions' do
      expect(word).to have_attributes(definitions: [])
    end 
  end
end
