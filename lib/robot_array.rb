class Array
  # Returns true if this array has duplicates in it
  #
  #     ["a", "b", "c", "a"].dupes?
  #     # => true
  #
  def dupes?
    self.uniq.length != self.length
  end
  
  # Returns true if this array has duplicates in it, using the
  # test passed in for uniqueness rather than the built in ruby
  # test for equality.
  #
  #     ["a", "b", "c", "A"].dupes_by?(&:downcase)
  #     # => true
  #
  def dupes_by?(&block)
    self.uniq_by(&block).length != self.length
  end
end

