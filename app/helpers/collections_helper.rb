module CollectionsHelper
  def valid_tags
      # Post::TAGS.map { |m| [ m ] }
      Collection::TAGS
  end

  def valid_categories
    Collection::CATEGORIES.map { |m| [ m ] }
  end
end
