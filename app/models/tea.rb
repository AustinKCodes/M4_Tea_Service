class Tea < ApplicationRecord
  has_many :subscriptions

  validates :tea_name, :description, :temperature, :brew_time, presence: true
end