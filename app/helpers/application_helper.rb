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

  def thinknetica
    link_to "Онлайн-школа Thinknetica", "https://thinknetica.com/", target: :_blank
  end

  def flash_message
    flash.map do |key, message|
      content_tag :p, message, class: "flash #{key}"
    end.join.html_safe
  end
end
