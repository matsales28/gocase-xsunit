
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
def testing_safe_or_not
  condition = Survivor.safe
  if condition =! nil
  @teste = "Safe"
  else
  @teste = "Abducted"
  end
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
  return {status: status, message: message}
end
