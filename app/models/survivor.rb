class Survivor < ApplicationRecord
  ## Validation of the input data
  validates :name , presence: true , length: {minimum:2}
  validates :age , presence: true , numericality: {only_integer:true , greather_than_or_equal_to: 0}
  validates :gender , presence: true

#   ## Status of the survivor
  scope :abducted, -> {where(status: true) }
  scope :safe, -> { where(status: false) }

end
