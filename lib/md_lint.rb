module MdLint
  def all_elements_of_type(type, elements_list)
    all_elements = []
    elements_list.each do |el|
      all_elements << el if el[:type] == type
    end
    all_elements
  end
end
