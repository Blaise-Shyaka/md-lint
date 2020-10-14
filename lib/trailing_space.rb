require 'English'

class TrailingSpace
  def space_after_line(file_object)
    warnings = []
    file_object.each do |line|
      warning = {
        error_type: 'No-trailing-spaces',
        error_description: 'There should be no trailing space at the end of line',
        line_number: $INPUT_LINE_NUMBER
      }
      warnings << warning if line[-2] == ' '
    end
    warnings
  end
end
