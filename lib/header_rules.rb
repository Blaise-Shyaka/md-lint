class HeaderRules
  def top_level_header(arr_of_headers)
    if arr_of_headers[0][:options][:level] != 1
      {
        error_type: 'First-header-h1',
        error_description: 'First header should be the top-level header [h1]',
        line_number: arr_of_headers[0][:options][:location]
      }
    end
  end

  def header_start_left_rule(arr_misaligned_headers)
    warnings = []

    arr_misaligned_headers.each do |header|
      misaligned_header = header[:children][0][:value].to_s.strip.split(' ')[0].to_s.split('')
      next if misaligned_header.empty?

      warning = {
        error_type: 'Indented header',
        error_description: 'The header should not be indented by one or more spaces',
        line_number: header[:options][:location]
      }
      warnings << warning if misaligned_header.all? '#'
    end
    warnings
  end
end
