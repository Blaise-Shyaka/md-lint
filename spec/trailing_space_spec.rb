require_relative 'spec_helper'
require_relative '../lib/trailing_space.rb'

describe 'Trailing space rules' do
  let(:test_file) { Dir.glob('**/*test-md.md')[0] }
  let(:warning_keys) { %i[error_type error_description line_number] }
  let(:trailing_space) { TrailingSpace.new }
  let(:file_object) { File.open(test_file) }

  it 'Should return an array' do
    expect(trailing_space.space_after_line(file_object)).to be_an_instance_of Array
  end

  it 'Should detect one error in the test-md.md' do
    expect(trailing_space.space_after_line(file_object).length).to eq(1)
  end

  it 'Should return an array containing a hash with three keys' do
    warning_hash = trailing_space.space_after_line(file_object)[0]
    expect(warning_hash.keys).to match_array warning_keys.sort
  end

  it 'The line_number key in the warning hash should be an integer' do
    warning_hash = trailing_space.space_after_line(file_object)[0]
    expect(warning_hash[:line_number]).to be_an_instance_of Integer
  end

  it 'The error_type key in the warning hash should be a string' do
    warning_hash = trailing_space.space_after_line(file_object)[0]
    expect(warning_hash[:error_type]).to be_an_instance_of String
  end

  it 'The error_description key in the warning hash should be a string' do
    warning_hash = trailing_space.space_after_line(file_object)[0]
    expect(warning_hash[:error_description]).to be_an_instance_of String
  end
end
