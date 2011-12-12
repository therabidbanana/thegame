module PathHelpers
  def link_text_for(text)
    case text
    when /(log|sign)\s?in with twitter/
      'Sign in with Twitter'
    when /(?:|the )registration page/
      'Sign Up'
    else 
      raise "Couldn't find link text mapping to: #{string}"
    end
  end
  def path_for(string)
    case string
    when /(log|sign)\s?in with twitter/
      '/auth/twitter'
    when /(?:|the )registration page/
      '/users/new'
    else 
      raise "Couldn't find path mapping to: #{string}"
    end
  end
end
World(PathHelpers)
