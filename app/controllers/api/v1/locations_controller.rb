require_relative 'side_functions'
module Api
	module V1
		class LocationsController < ApplicationController
			
			def show
				location = Location.select(:latitude,:longitude).find(params[:survivor_id])
				name = Survivor.find(params[:survivor_id]).name
				status = 'SUCCESS'
				data = {
					survivor: name,
					location: location
					
				}
				code = 200
        renderOutput(status,data,code)
      end
			def update
        survivor = Survivor.find(params[:survivor_id])
				if survivor.location.update(location_params)
					status = 'SUCCESS'
					data = {
						location: survivor.location
					}
          code = 200
				else
					status = 'ERROR'
					data{
						message:"Could not update survivor location"
					}
					code = 400
        end
        renderOutput(status,data,code)
				
			end	
		end
	end
end