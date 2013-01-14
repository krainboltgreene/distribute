require 'minitest/autorun'
require 'helper'

class TestDistribute < MiniTest::Unit::TestCase
  def setup
    system "mkdir tmp/" unless File.exists? "tmp"
    @files = ['tmp/example1.file', 'tmp/example2.file', 'tmp/example3.file']
    system "touch #{@files.join(" ")}"
    @latest = Latest.new @files
  end

  def test_get_new_files
    expected = ['example1.file', 'example2.file', 'example3.file']
    @latest.send :get_new_files
    actual = @latest.files
    assert_equal expected, actual
  end

  def test_file_from_path
    expected = 'example1.file'
    actual = @latest.send :file_from_path, 'tmp/example1.file'
    assert_equal expected, actual
  end

  def test_file_extention
    expected = 'file'
    actual = @latest.send :file_extention, 'example1.file'
    assert_equal expected, actual
  end
end
