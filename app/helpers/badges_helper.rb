module BadgesHelper
  def rules_collection
    BadgeService::RULES.map do |rule|
      [t(:rule_desc, scope: rule.underscore.to_sym), rule]
    end
  end
end
