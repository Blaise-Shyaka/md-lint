class HeaderRules
  def top_level_header(arr_of_headers)
    if arr_of_headers[0][:options][:level] != 1
      {
        error_type: 'Headers',
        error_description: 'First header should be top-level header',
        line_number: arr_of_headers[0][:options][:location]
      }
    end
  end
end
