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
#Params to grab random values beetwen negative and positive value
def locationParams(location)
  return rand(-location .. location)
end

#For seedig the survivor_id
@counter = 1

#How many seeds do you want to
@quantidade = 10

@quantidade.times do
  Survivor.create({
    name: Faker::Games::Pokemon.name,
    gender: randomGender,
    age: Faker::Number.between(from: 0, to: 100),
    status: false,
  })

  Location.create({
    latitude: locationParams(90),
    longitude: locationParams(180),
    survivor_id: @counter
  })

  Flag.create({
    flagger_id: rand(@quantidade-1)+1,
    survivor_id: rand(@quantidade-1)+1
  })
  @counter += 1
end

