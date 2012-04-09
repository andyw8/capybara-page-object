# TODO clean this all up
require 'html5_data'

module CapybaraPageObject
  class Element < CapybaraPageObject::Node
    include CapybaraPageObject::Collections
    include CapybaraPageObject::HTML5Data
  end
end

require 'elements/text_based_input'
require 'elements/anchor'
require 'elements/form'
require 'elements/image'
require 'elements/form_field'
require 'elements/head'
require 'elements/input'
require 'elements/list'
require 'elements/list_item'
require 'elements/meta'
require 'elements/select'
require 'elements/table'
require 'elements/table_row'
require 'elements/table_header'
require 'elements/textarea'
