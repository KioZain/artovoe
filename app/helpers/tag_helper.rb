module TagHelper
  def add_or_remove_tag(current_tags, new_tag)
    current_tags ||= []
    if current_tags.include?(new_tag)
      current_tags.reject { |t| t == new_tag }
    else
      current_tags + [ new_tag ]
    end
  end
end
