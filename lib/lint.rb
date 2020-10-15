require_relative './md_lint.rb'

class Lint
  include MdLint

  def print_warnings(*args)
    all_messages = all_warnings(*args)
    all_messages.each do |warning|
      puts warning
    end
  end

  def files_to_lint
    return Dir.glob('**/*.md') if ARGV.length.zero?

    ARGV
  end

  private

  def all_warnings(*args)
    messages = []
    args.each do |arg|
      next if arg.length.zero?

      arg.each do |warning|
        messages << "#{warning[:error_type]} on line #{warning[:line_number]}: #{warning[:error_description]}"
      end
    end
    messages
  end
end
