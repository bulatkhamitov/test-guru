class Badge < ApplicationRecord
  RULES = %w[FirstTryBadge
             CategoryBadge
             LevelBadge]
             
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :icon_url, presence: true
  validates :rule, presence: true, allow_blank: true

  def self.icons
    Dir.entries('app/assets/images/badges').reject do |file|
      File.directory?(file)
    end
  end
end
