class Flag < ApplicationRecord
  belongs_to :survivor

  validates :flagger_id, presence: true
end
