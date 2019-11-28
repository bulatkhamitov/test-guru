module ApplicationHelper
  def current_year
    Time.current.year
  end

  def author_name
    'Хамитов Булат'
  end

  def author_git
    'bulatkhamitov'
  end

  def repo
    'test-guru'
  end

  def githib_url(author, repo)
    link_to 'github', "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
