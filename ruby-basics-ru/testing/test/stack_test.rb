# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
    @element = 1
  end

  def teardown
    @stack = nil
  end

  def test_add_element
    @stack.push!(@element)
    assert_equal @stack.to_a[0], @element
  end

  def test_remove_element
    @stack.push!(@element)
    @stack.pop!
    assert_empty @stack.to_a
  end

  def test_clear
    @stack.push!(@element)
    @stack.clear!
    assert @stack.empty?
    assert_empty @stack.to_a
  end

  def test_empty_check
    assert @stack.empty?
    assert_empty @stack.to_a
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
