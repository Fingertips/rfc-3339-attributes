require File.expand_path('../test_helper', __FILE__)

class Member < ActiveRecord::Base
  rfc_3339_attributes :measured_at
  
  validates_rf_3339_format_of :measured_at
end

class RFC3339AttributesValidationTest < ActiveSupport::TestCase
  def setup
    RFC3339AttributesTest::Initializer.setup_database
    @member = Member.new
  end
  
  def teardown
    RFC3339AttributesTest::Initializer.teardown_database
  end
  
  test "accepts valid timestamps" do
    %w{
      2010-03-21T21:20:56+01:00
    }.each do |timestamp|
      assert_valid_timestamp(timestamp)
    end
  end
  
  test "rejects invalid timestamps" do
    %w{
      invalid
    }.each do |timestamp|
      assert_invalid_timestamp(timestamp)
    end
  end
  
  private
  
  def assert_valid_timestamp(timestamp)
    @member.measured_at = timestamp
    @member.valid?
    assert @member.errors.on(:measured_at).blank?, "Expected `#{timestamp}' to be valid"
  end
  
  def assert_invalid_timestamp(timestamp)
    @member.measured_at = timestamp
    @member.valid?
    assert !@member.errors.on(:measured_at).blank?, "Expected `#{timestamp}' to be invalid"
  end
end