module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    if test.new_record?
      "Create new test"
    else
      "Edit #{test.title} test"
    end
  end

  def number_of_questions(test)
    test.questions.count
  end

  def time_limit(test)
    test.time_limit
  end
end
