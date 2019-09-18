
#Params functions
def location_params
  params.permit(:latitude, :longitude)
end

def survivor_params
  params.permit(:name, :age,:gender)
end

def flag_params
  return params.permit(:survivor_id,:flagger_id)
end


#Render the output

def renderOutput(status,data,code)
  render json: {
      status: status,
      data: data
  }, status: code
end

#Function to test if survivor is safe or abducted
def testingSafeOrNot
  condition = Survivor.find(params[:id]) 
  if condition.status == false
    @teste = "Safe"
  else
    @teste = "Abducted"
  end
  return @teste
end


#Function to validate or not a flag
def validateTheFlag(survivor, flagger)
  conditionToValidate = false
  if survivor == flagger
    message = 'A survivor can not give his own flag'
  elsif flagger.status == true
    message = 'An abducted survivor can not flag another abduction'
  elsif Flag.where(flagger_id: flagger.id, survivor_id: survivor.id).exists?
    message = 'You can not report a flag for the same survivor twice'
  else
    conditionToValidate = true
    message = 'Flag reported'
  end
  return {status: conditionToValidate, message: message}
end


##Functions used on GET /api/v1/reports

#Function to get the percentage of Abducted Survivors
def abductedPercentage
  @survivorsAbducted = Survivor.abducted.size
  @survivorsSafe = Survivor.safe.size
  @totalSurvivors = @survivorsAbducted + @survivorsSafe
  @percentageOfAbductedSurvivors = (@survivorsAbducted*100/@totalSurvivors).to_f.round(2)
  return @percentageOfAbductedSurvivors
end

#Function to get the percentage of Safe Survivors
def safePercentage
  return 100 - abductedPercentage
end


def survivorsAndStatusOrderedAlphabetical
  survivorsOrdered = Survivor.order('name ASC')
  survivorsAndStatusArray = survivorsOrdered.pluck(:name,:status)
  for i in 0..survivorsAndStatusArray.length-1
    if survivorsAndStatusArray[i][1] == false
      survivorsAndStatusArray[i][1] = "Safe"
    else
      survivorsAndStatusArray[i][1] = "Abducted" 
    end
  end
  return survivorsAndStatusArray
end