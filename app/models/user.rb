class User < ApplicationRecord
  def passed_by_level(level)
    Test.joins('JOIN passedtests ON passedtests.tests_id = tests_id').where(tests: { level: level }, passedtests: { users_id: self.id })
  end
end
