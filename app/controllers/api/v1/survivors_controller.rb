module Api
    module V1
      class SurvivorsController < ApplicationController
  
        def index
            survivors = Survivor.order('name ASC')
            render json: {
                status: 'SUCCESS',
                data: survivors
            }, status: :ok
            
        end
        

        def create
          survivor = Survivor.new(survivor_params)
          if survivor.save and survivor.create_location(latitude: params[:latitude], longitude: params[:longitude])
            status = 'SUCCESS'
            data = {
              survivor: survivor,
              survivorLocation: survivor.location
            }
          end
          statusCode = 400
          render json: {
            status: status,
            data: data
          }, status:statusCode
          
        end
        
        private 
        def survivor_params
          params.permit(:name, :age,:gender)
        end

      end
    end
  end