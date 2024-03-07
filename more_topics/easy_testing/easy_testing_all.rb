require 'minitest/autorun'

require_relative "employee_class"
require_relative "list_class"

class EasyTestingTest < Minitest::Test
  def setup
    @boolean_value = 2
    @downcase_value = "XyZ"
    @nil_value = false
    @list = [1]
    @employee = Employee.new
    @object_type_value = Object.new
    @object_kind_value = String.new("string")
    @list_class = List.new
    @second_list = ["xyz"]
  end

  # Boolean Assertions
  def test_odd_question
    assert_equal(true, @boolean_value.odd?)
  end

  # Equality Assertions
  def test_downcase
    assert_equal("xyZ", @downcase_value.downcase)
  end

  # Nil Assertions
  def test_nil_value
    assert_nil(@nil_value)
  end

  # Empty Object Assertions
  def test_array_empty
    assert_empty(@list)
  end

  # Included Object Assertions
  def test_included_object
    assert_includes(@list, "xyz")
  end

  # Exception Assertions
  def test_no_experience_error
    @employee.experience = 1
    assert_raises(NoExperienceError) { @employee.hire }
  end

  # Type Assertions
  def test_object_type
    assert_instance_of(Numeric, @object_type_value)
  end

  # Kind Assertions
  def test_object_kind
    assert_kind_of(Numeric, @object_kind_value)
  end

  # Same Object Assertions
  def test_same_object
    assert_same(@list_class, @list_class.process)
  end

  # Refutations
  def test_excluded_object
    refute_includes(@second_list, "xyz")
  end
end