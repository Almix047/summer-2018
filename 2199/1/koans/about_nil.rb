require File.expand_path(File.dirname(__FILE__) + '/neo')
# Lets think about nil
class AboutNil < Neo::Koan
  def test_nil_is_an_object
    assert_equal true, nil.is_a?(Object), 'Unlike NULL in other languages'
  end

  # rubocop:disable Layout/CommentIndentation, Layout/IndentationWidth
  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
  nil.some_method_nil_doesnt_know_about # rubocop:disable Layout/IndentationWidth
  rescue StandardError => ex
    # What exception has been caught?
    assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      # rubocop:disable Layout/IndentationConsistency
      assert_match(/undefined method `some_method_nil_doesnt_know_about' for nil:NilClass/, ex.message)
    # rubocop:enable Layout/IndentationConsistency
  end
  # rubocop:enable Layout/CommentIndentation, Layout/IndentationWidth

  # :reek:NilCheck
  def test_nil_has_a_few_methods_defined_on_it
    assert_equal true, nil.nil?
    assert_equal '', nil.to_s
    assert_equal 'nil', nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
  end
end
