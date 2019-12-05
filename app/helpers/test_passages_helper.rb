module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.passed?
      return 'You have passed the test!'
    else
      return 'You have failed the test.'
    end
  end

  def test_status(test_passage)
    if test_passage.passed?
      return 'passed'
    else
      return 'failed'
    end
  end
end
