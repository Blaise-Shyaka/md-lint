class TrailingSpace
  def space_after_line(file_object)
    warnings = []
    file_object.each do |line|
      warning = {
        error_type: 'No-trailing-spaces',
        error_description: 'No trailing space at the end of line',
        line_number: $.
      }
      warnings << warning if line[-2] == ' '
    end
    warnings
  end
end