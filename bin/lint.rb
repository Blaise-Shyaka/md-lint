#!/usr/bin/env ruby

require 'kramdown'
require 'kramdown-parser-gfm'
require_relative '../lib/md_lint.rb'
require_relative '../lib/header_rules.rb'

class Lint
  attr_reader :file_to_parse, :parsed_file

  def initialize
    @file_to_parse = File.open(ARGV[0]).read
    @parsed_file = Kramdown::Document.new(file_to_parse, input: 'GFM').to_hash_ast
  end
  include MdLint
end

lint = Lint.new
header = HeaderRules.new

# puts '====== Top-level header rule ======'
# list_of_headers = lint.all_elements_of_type(:header, lint.parsed_file[:children])
# puts lint.parsed_file[:children]
# puts list_of_headers
# puts header.top_level_header(list_of_headers)
# puts '====== Header-start-left header rule ======'
# puts lint.parsed_file[:children][2]
# list_of_spaced_headers = lint.all_elements_of_type(:p, lint.parsed_file[:children])
# puts header.header_start_left_rule(list_of_spaced_headers)
