class LineLength
  def line_length(file_object)
    warnings = []
    file_object.each do |line|
      p line
      warning = {
        error_type: 'Line-length',
        error_description: 'Line is too long',
        line_number: $INPUT_LINE_NUMBER
      }
      warnings << warning if line.length > 80
    end
    warnings
  end
end
