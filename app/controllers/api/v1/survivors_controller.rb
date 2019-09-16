require_relative 'side_functions'
module Api
    module V1
      class SurvivorsController < ApplicationController
        

        #Show all the survivor in alphabetic order
        def index
            survivors = Survivor.order('name ASC')
            render json: {
                status: 'SUCCESS',
                data: survivors
            }, status: 200
            
        end
        
        #Show a single survivor passing the ID
        def show 
        survivor = Survivor.find(params[:id])
        status = 'SUCCESS'
        data = { 
          survivor: survivor,
          condition: testing_safe_or_not
        }
        code = 200
        
        renderOutput(status,data,code)
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
          code = 400
          renderOutput(status,data,code)
          
        end
      end
    end
  end