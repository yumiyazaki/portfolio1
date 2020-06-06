class Program < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :broadcaster, presence: true
  validates :wday, presence: true
  validates :airtime, presence: true
end
