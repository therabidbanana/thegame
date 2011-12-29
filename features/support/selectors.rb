module SelectorHelpers
  def xpath_for(text)
    case text
    when /image (.+)/
      "//img[contains(@src, \"#{$1}\")]"
    end
  end
  def selector_for(text)
    case text
    when /post/
      'article.post'
    end
  end
end
World(SelectorHelpers)

