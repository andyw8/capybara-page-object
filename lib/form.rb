require File.dirname(__FILE__) + '/base'

module CapybaraPageObject
  class Form < CapybaraPageObject::Base
    
    CHECKABLE = ['radio', 'checkbox']
    BUTTON_TYPES = ['submit', 'reset', 'button']

    def fields
      r = {}
      all('input').each do |input|
        if CHECKABLE.include?(input[:type])
          r[input[:name]] = !!input.checked?
        elsif !BUTTON_TYPES.include?(input[:type])
          r[input[:name]] = input.value
        end
      end
      all('select').each do |select|
        r[select[:name]] = select.value
      end
      all('textarea').each do |select|
        r[select[:name]] = select.value
      end
      r
    end

    def buttons
      r = []
      all('input').each do |input|
        next unless BUTTON_TYPES.include?(input[:type])
        r << input
      end
      all('button').each do |button|
        r << button
      end
      r
    end
  end
end
