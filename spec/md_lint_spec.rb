require 'kramdown'
require 'kramdown-parser-gfm'
require_relative 'spec_helper'
require_relative '../lib/header_rules.rb'
require_relative '../lib/md_lint.rb'

describe 'Lint' do
  let(:test_file) { Dir.glob('**/*test-md.md')[0] }
  let(:parsed_file) { Kramdown::Document.new(File.open(test_file).read, input: 'GFM').to_hash_ast }
  include MdLint

  describe 'Header rules' do
    let(:all_headers) { all_elements_of_type(:header, parsed_file[:children]) }
    let(:misaligned_headers) { all_elements_of_type(:p, parsed_file[:children]) }
    let(:header) { HeaderRules.new }
    let(:warning_keys) { %i[error_type error_description line_number] }

    describe 'Top-level header rule' do
      it 'Should return an array' do
        expect(header.top_level_header(all_headers)).to be_an_instance_of Array
      end

      it 'Should return an array containing a hash with three keys' do
        warning_hash = header.top_level_header(all_headers)[0]
        expect(warning_hash.keys).to match_array warning_keys.sort
      end

      it 'The line_number key in the warning hash should be an integer' do
        warning_hash = header.top_level_header(all_headers)[0]
        expect(warning_hash[:line_number]).to be_an_instance_of Integer
      end

      it 'The error_type key in the warning hash should be a string' do
        warning_hash = header.top_level_header(all_headers)[0]
        expect(warning_hash[:error_type]).to be_an_instance_of String
      end

      it 'The line_number key in the warning hash should be an integer' do
        warning_hash = header.top_level_header(all_headers)[0]
        expect(warning_hash[:error_description]).to be_an_instance_of String
      end

      it 'Should highlight one line violating this rule in the test-md.md file' do
        expect(header.top_level_header(all_headers).length).to eq(1)
      end
    end
  end
end
