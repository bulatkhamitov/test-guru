class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def passed_by_level(level)
    Test.joins('JOIN passed_tests ON passed_tests.test_id = tests.id').where(passed_tests: { user_id: id }, level: level)
  end
end
