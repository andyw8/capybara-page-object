module Delegators
  # TODO why doesn't method_missing work?
  def all(*args)
    source.all(*args)
  end

  def find(*args)
    source.find(*args)
  end
  
  # TODO why is this needed?
  def text
    root_node.text
  end
end
