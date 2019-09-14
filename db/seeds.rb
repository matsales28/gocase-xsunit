## Method to generate a randomGender between Male, Female or Trans
def randomGender
  randomNumber = Faker::Number.between(from: 0, to: 15)
  if randomNumber <= 5
    return "M"
  elsif randomNumber <=10
    return "F"
  else
    return "T"
  end
end

def locationParams(location)
  return rand(-location .. location)
end

@counter = 1

10.times do
  Survivor.create({
    name: Faker::Games::Pokemon.name,
    gender: randomGender,
    age: Faker::Number.between(from: 0, to: 100),
    status: Faker::Boolean.boolean,
  })

  Location.create({
    latitude: locationParams(90),
    longitude: locationParams(180),
    survivor_id: @counter
  })
  @counter += 1
end

