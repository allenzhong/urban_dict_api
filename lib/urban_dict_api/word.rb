module UrbanDictApi
  class Word
    attr_accessor :value, :tags, :definitions

    def initialize(&block)
      instance_eval &block if block_given?
    end

    def tags
      @tags ||= []
    end

    def definitions
      @definitions ||= []
    end
  end
end
