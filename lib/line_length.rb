class LineLength
  def line_length(file_object)
    warnings = []
    file_object.each do |line|
      warning = {
        error_type: 'Line-length',
        error_description: 'Line is too long',
        line_number: file_object.find_index(line) + 1
      }
      warnings << warning if line.length > 80
    end
    warnings
  end
end
