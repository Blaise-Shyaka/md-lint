module MdLint
  # List of methods I will need
  ## 1. Write a method to retrieve all elements of a certain type
  ##### Takes the type of an element as the first parameter
  ##### return an array of their options hash
  ##### The method should not be recursive

  def all_elements_of_type(type, elements_list)
    all_elements = []
    elements_list.each do |el|
      all_elements << el if el[:type] == type
    end
    all_elements
  end
end
