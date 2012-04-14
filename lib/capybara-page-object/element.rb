module CapybaraPageObject
  class Element < CapybaraPageObject::Node
    include CapybaraPageObject::Collections
    include CapybaraPageObject::HTML5Data
  end
end
