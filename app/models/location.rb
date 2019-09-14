class Location < ApplicationRecord
  belongs_to :survivor

  validates :latitude, presence: true, numericality: { less_than_or_equal_to: 90, greater_than_or_equal_to: -90}
  
  validates :longitude, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180}

end
