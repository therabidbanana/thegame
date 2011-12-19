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
      '/players/new'
    when /(?:|the )new post page/
      '/posts/new'
    when /(?:|the )home page/
      '/'
    when /(.+)'s player page$/
      p = Player.find_by_username($1)
      player_path(p)
    else 
      raise "Couldn't find path mapping to: #{string}"
    end
  end
end
World(PathHelpers)
