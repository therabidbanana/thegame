module SelectorHelpers
  def selector_for(text)
    case text
    when /post/
      'article.post'
    end
  end
end
World(SelectorHelpers)

