require_relative 'spec_helper'
require_relative '../lib/line_length'

describe 'Line-length rule' do
  let(:test_file) { Dir.glob('**/*test-md.md')[0] }
  let(:warning_keys) { %i[error_type error_description line_number] }
  let(:line_length) { LineLength.new }
  let(:file_object) { File.readlines(test_file) }

  it 'Should return an array' do
    expect(line_length.line_length(file_object)).to be_an_instance_of Array
  end

  it 'Should detect one error in the test-md.md' do
    expect(line_length.line_length(file_object).length).to eq(1)
  end

  it 'Should return an array containing a hash with three keys' do
    warning_hash = line_length.line_length(file_object)[0]
    expect(warning_hash.keys).to match_array warning_keys.sort
  end

  it 'The line_number key in the warning hash should be an integer' do
    warning_hash = line_length.line_length(file_object)[0]
    expect(warning_hash[:line_number]).to be_an_instance_of Integer
  end

  it 'The line_number with an error should be 7' do
    warning_hash = line_length.line_length(file_object)[0]
    expect(warning_hash[:line_number]).to eq(7)
  end

  it 'The error_type key in the warning hash should be a string' do
    warning_hash = line_length.line_length(file_object)[0]
    expect(warning_hash[:error_type]).to be_an_instance_of String
  end

  it 'The error_description key in the warning hash should be a string' do
    warning_hash = line_length.line_length(file_object)[0]
    expect(warning_hash[:error_description]).to be_an_instance_of String
  end
end
