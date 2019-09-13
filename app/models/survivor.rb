class Survivor < ApplicationRecord
  validates: name , presence: true , length: {minimum:2}
  validates: age , presence: true , numericality: {only_integer:true , greather_than_or_equal_to: 0}
  validates: gender , presence: true , format: {with: /M|F|T}
end
