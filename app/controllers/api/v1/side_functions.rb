
#Params functions
def location_params
    params.permit(:latitude, :longitude)
end

def survivor_params
    params.permit(:name, :age,:gender)
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