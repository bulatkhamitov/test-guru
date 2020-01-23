class BadgeService
  RULES = %w[FirstTryBadge
             CategoryBadge
             LevelBadge].freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send(badge.rule.underscore.to_sym, badge)
    end
  end

  private

  def first_try_badge(_blank)
    @test_passage.passed? && @user.tests.where(id: @test.id).count == 1
  end

  def category_badge(badge)
    category = badge.rule_value

    return false unless @test_passage.passed?

    return false unless @test.category == category

    if @user.rewarded?(badge)
      Test.sort_by_category(category).count == user_tests_by_category(category)
          .where('test_passages.created_at > ?', UserBadge.all.where(user: @user, badge: badge).oder('created_at').last.created_at)
          .uniq.count
    else
      Test.sort_by_category(category).count == user_tests_by_category(category).uniq.count
    end
  end

  def level_badge(badge)
    level = badge.rule_value

    return false unless @test_passage.passed?

    return false unless @test.level == level

    if @user.rewarded?(badge)
      Test.all.where(level: level).count == user_tests_by_level(level)
          .where('test_passages.created_at > ?', UserBadge.all.where(user: @user, badge: badge).oder('created_at').last.created_at)
          .uniq.count
    else
      Test.all.where(level: level).count == user_tests_by_level(level).uniq.count
    end
  end

  def passed_user_tests
    @user.tests_passages.joins(:test).where(passed: true)
  end

  def user_tests_by_level(level)
    passed_user_tests.where(tests: {level: level })
  end

  def user_tests_by_category(category)
    passed_user_tests.where(tests: { category_id: Category.find_by(title: category).id })
  end
end
