# -*- encoding : utf-8 -*-
module Delegators
  # TODO why doesn't method_missing work?
  def all(*args)
    source.all(*args)
  end

  def find(*args)
    source.find(*args)
  end

  def text
    source.text
  end
end
