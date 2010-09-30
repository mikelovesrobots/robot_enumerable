require 'robot_array'

module Enumerable
  # Moves any elements for which the block returns true to the front of the list,
  # otherwise maintaining the original order.  One place where this method is 
  # useful is the situation where you have a bunch of options for a select box
  # and you want the default value to be first.
  #
  #    [1,2,3,4,5].bump_to_front { |x| x == 3 }
  #    # => [3,1,2,4,5]
  #   
  def bump_to_front(&block)
    matches, failures = partition(&block)
    matches + failures 
  end
  
  # Moves any elements for which the block returns true to the back of the list,
  # otherwise maintaining the original order.
  #
  #    [1,2,3,4,5].bump_to_back { |x| x == 3 }
  #    # => [1,2,4,5,3]
  #   
  def bump_to_back(&block)
    matches, failures = partition(&block)
    failures + matches
  end

  # Just like uniq, but lets you use an attribute or quality of an object for the
  # comparison test rather than the object's structure.
  #
  #  ["Sarah", "SARAH", "sarah"].uniq_by { |x| x.downcase }
  #  # => ["Sarah"]
  #
  def uniq_by
    seen = {}
    select { |v|
      key = yield(v)
      (seen[key]) ? nil : (seen[key] = true)
    }
  end
end
