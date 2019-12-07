module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.passed?
      'You have passed the test!'
    else
      'You have failed the test.'
    end
  end

  def test_status(test_passage)
    if test_passage.passed?
      'passed'
    else
      'failed'
    end
  end
end
