## Method to generate a randomGender between Male, Female or Trans
def randomGender
  randomNumber = Faker::Number.between(from: 0, to: 10)
  if randomNumber <= 5
    return "M"
  else
    return "F"
  end
end

#Params to grab random values beetwen negative and positive value
def locationParams(location)
  return rand(-location .. location)
end

#For seedig the survivor_id
@counter = 1

#How many survivors do you want to
@quantityOfSurvivors = 20

#How many flaggs do you want
@quantityOfFlags = 40

@quantityOfSurvivors.times do
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

  @counter += 1
end

@quantityOfFlags.times do
  flaggerId = Faker::Number.within(range: 1..@quantityOfSurvivors)
  survivorId = Faker::Number.within(range: 1..@quantityOfSurvivors)
  if flaggerId != survivorId 
  Flag.create({
    flagger_id: flaggerId,
    survivor_id: survivorId
  })
  end
end


# Updating the database generated
for i in 1..@quantityOfSurvivors 
numberOfFlags = Flag.where(survivor_id: i).count
  if numberOfFlags >= 3
    Survivor.update(i,:status => true)
  end
end