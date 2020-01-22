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

  def first_try_badge(blank)
    @test_passage.passed? && @user.tests.where(id: @test.id).count == 1
  end

  def category_badge(category)
    @test_passage.passed? && (Test.sort_by_category(category).count == @user.tests.where(category: category).uniq.count)
  end

  def level_badge(level)
    @test_passage.passed? && (Test.all.where(level: level).count == @user.tests.where(level: level).uniq.count)
  end
end
