require 'rubygems'
require 'capybara'

module Capybara
  module Node
    module Finders
      def title
        find('title').text
      end

      def tables(attr={})
        extract('table', attr)
      end

      def forms(attr={})
        extract('form', attr)
      end

      def rows(attr={})
        extract('tr', attr)
      end

      def headers(attr={})
        extract('th', attr)
      end

      def meta_description
        extract('meta', :by => 'name')['description']['content']
      end
      
      def meta_keywords
        extract('meta', :by => 'name')['keywords']['content'].split(',').collect(&:strip)
      end

      def data
        r = {}
        native.attributes.each do |k, v|
          next unless k.start_with?('data-')
          r[k.gsub('data-', '')] = v.value
        end
        r
          
      end

      private

      def extract(element, attr={})
        by = attr[:by]
        if by
          r = {}
          all(element).each do |t|
            r[t[by]] = t
          end
          r
        else
          all(element)
        end
      end
    end
  end
end
