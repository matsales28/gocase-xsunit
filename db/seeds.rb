# Method to generate a random gender between Male, Female or Trans
def random_gender
  random_number = Faker::Number.between(from: 0, to: 10)
  if random_number <= 5
    return 'M'
  else
    return 'F'
  end
end

# Params to grab random values beetwen negative and positive value
def location_params(location)
  return rand(-location..location)
end

# For seedig the survivor_id
@counter = 1

# How many survivors do you want to
@quantity_of_survivors = 20

# How many flaggs do you want
@quantity_of_flags = 40

@quantity_of_survivors.times do
  Survivor.create({
    name: Faker::Games::Pokemon.name,
    gender: random_gender,
    age: Faker::Number.between(from: 0, to: 100),
    status: false
  })

  Location.create({
    latitude: location_params(90),
    longitude: location_params(180),
    survivor_id: @counter
  })

  @counter += 1
end

@quantity_of_flags.times do
  flagger_id = Faker::Number.within(range: 1..@quantity_of_survivors)
  survivor_id = Faker::Number.within(range: 1..@quantity_of_survivors)
  if flagger_id != survivor_id
    Flag.create({
      flagger_id: flagger_id,
      survivor_id: survivor_id
    })
  end
end

# Updating the database generated
for i in 1..@quantity_of_survivors
  number_of_flags = Flag.where(survivor_id: i).count
    if number_of_flags >= 3
      Survivor.update(i,:status => true)
    end
end
