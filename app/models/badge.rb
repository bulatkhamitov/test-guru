class Badge < ApplicationRecord
  validates :title, :icon_url, :rule, presence: true
end
