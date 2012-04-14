# need to add each_with_object for Ruby 1.8.7
module Enumerable
  def each_with_object(memo)
    return to_enum :each_with_object, memo unless block_given?
    each do |element|
      yield element, memo
    end
    memo
  end
end