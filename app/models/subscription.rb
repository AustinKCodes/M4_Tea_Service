class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: { active: 0, disabled: 1 }
  enum frequency: { weekly: 0, monthly: 1, yearly: 2 }
end