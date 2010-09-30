require 'helper'

class TestRobotEnumerable < Test::Unit::TestCase
  context "Enumerable" do
    context "#bump_to_front" do
      should "move elements that match the block to the front of the array" do
        assert_equal [3,1,2,4,5], [1,2,3,4,5].bump_to_front { |x| x == 3 }
      end
    end 
    
    context "#bump_to_back" do
      should "move elements that match the block to the back of the array" do
        assert_equal [1,2,4,5,3], [1,2,3,4,5].bump_to_back { |x| x == 3 }
      end
    end 

    context "#uniq_by" do
      should "strip duplicate elements out of the list using the block test" do
        assert_equal ["Charles", "Sarah", "Diego"],
          ["Charles", "Sarah", "SARAH", "Diego", "sarah"].uniq_by(&:downcase)
      end
    end
  end

  context "Array" do
    context "#dupes?" do
      should "return true if an array has duplicates" do
        assert ["a","b","c","a"].dupes?
      end
      
      should "return false if an array has no duplicates" do
        assert !["a","b","c"].dupes?
      end
    end

    context "#dupes_by?" do
      should "return true if an array has duplicates (based on the passed in block test)" do
        assert ["a","b","c","A"].dupes_by?(&:downcase)
      end

      should "return false if an array has no duplicates (based on the passed in block test)" do
        assert !["a","b","c"].dupes_by?(&:downcase)
      end
    end
  end
end
