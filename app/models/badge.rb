class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :icon_url, :rule, :rule_value, presence: true
  validates :rule, inclusion: { in: BadgeService::RULES, message: 'Wrong rule' }
  validates :rule_value, uniqueness: { scope: :rule, message: 'The badge already exists' }

  def self.icons
    Dir.entries('app/assets/images/badges').reject do |file|
      File.directory?(file)
    end
  end
end
