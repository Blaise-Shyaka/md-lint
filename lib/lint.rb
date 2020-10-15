require_relative './md_lint.rb'

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
