require File.dirname(__FILE__) + '/base'

module CapybaraPageObject
  class Form < CapybaraPageObject::Base
    def action
      find('form')[:action]
    end
    
    def fields
      r = {}
      find('form').all('input').each do |input|
        r[input[:name]] = input[:value]
      end
      r
    end
  end
end
