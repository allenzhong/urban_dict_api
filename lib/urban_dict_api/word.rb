module UrbanDictApi
  class Word
    attr_accessor :tags, :definitions

    def initialize(tags = [], definitions = [])
      @tags = tags
      @definitions = definitions
    end
  end
end
