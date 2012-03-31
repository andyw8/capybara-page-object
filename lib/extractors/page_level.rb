require File.dirname(__FILE__) + '/common'

module Extractors
  module PageLevel
    include Common
    
    def title
      find('title').text
    end

    def meta_description
      extract('meta', :by => 'name')['description']['content']
    end
  
    def meta_keywords
      extract('meta', :by => 'name')['keywords']['content'].split(',').collect(&:strip)
    end
  end
end