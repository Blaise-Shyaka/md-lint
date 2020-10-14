#!/usr/bin/env ruby

require 'kramdown'
require 'kramdown-parser-gfm'
require_relative '../lib/md_lint.rb'
require_relative '../lib/header_rules.rb'
require_relative '../lib/trailing_space.rb'
require_relative '../lib/line_length.rb'

class Lint
  include MdLint

  def files_to_lint
    return Dir.glob('**/*.md') if ARGV.length.zero?

    ARGV
  end

  def print_warnings(*args)
    args.each do |arg|
      next if arg.length.zero?

      arg.each do |warning|
        puts "#{warning[:error_type]} on line #{warning[:line_number]}: #{warning[:error_description]}"
      end
    end
  end
end

lint = Lint.new
header = HeaderRules.new
trailing_space = TrailingSpace.new
line_length = LineLength.new
all_files = lint.files_to_lint

all_files.each do |file|
  puts ''
  puts '=================='
  puts "In file #{file}"
  puts '=================='

  file_object = File.open(file)
  parsed_file = Kramdown::Document.new(File.open(file).read, input: 'GFM').to_hash_ast
  all_headers = lint.all_elements_of_type(:header, parsed_file[:children])
  misaligned_headers = lint.all_elements_of_type(:p, parsed_file[:children])

  if all_headers.length.positive?
    lint.print_warnings(header.top_level_header(all_headers), header.header_start_left_rule(misaligned_headers))
  end

  lint.print_warnings(trailing_space.space_after_line(file_object), line_length.line_length(file_object))
end

# puts '====== Top-level header rule ======'
# list_of_headers = lint.all_elements_of_type(:header, lint.parsed_file[:children])
# puts lint.parsed_file[:children]
# puts list_of_headers
# puts header.top_level_header(list_of_headers)
# puts '====== Header-start-left header rule ======'
# puts lint.parsed_file[:children][2]
# list_of_spaced_headers = lint.all_elements_of_type(:p, lint.parsed_file[:children])
# puts header.header_start_left_rule(list_of_spaced_headers)
# puts "======= Trailing space ======="
# p trailing_space.space_after_line(lint.file_object)
# puts "======= Line length ======="
# puts "======= Line length ======="
# p line_length.line_length(lint.file_object)
# p lint.get_files
# def foo (str)
#   str
# end
# lint.print_warnings(foo('hey'), foo('hi'), foo('foo') )
