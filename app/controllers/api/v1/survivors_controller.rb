require_relative 'side_functions'
module Api
    module V1
      class SurvivorsController < ApplicationController
        

        #Show all the survivor in alphabetic order
        def index
            survivors = Survivor.order('name ASC')
            status = 'SUCCESS'
            data = {
              survivor: survivors
            }
            code = 200
            renderOutput(status,data,code)
        end
        
        #Show a single survivor passing the ID
        def show 
        survivor = Survivor.find(params[:id])
        status = 'SUCCESS'
        data = { 
          survivor: survivor,
          condition: testingSafeOrNot
        }
        code = 200
        
        renderOutput(status,data,code)
        end

        # Crete a new survivor 
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

        # Destroy a specific survivor data(RIP) 
        def destroy
          survivor = Survivor.find(params[:id])
          if survivor.destroy
            status = 'SUCCESS'
            data = {
              message: 'Survivor Deleted'
            }
            code = 200
          else 
            status = 'ERROR'
            data ={
              message: 'Could not delete the survivor'
            }
            code = 400
          end
          renderOutput(status,data,code)
        end

        # Get reports from survivor db, using side_functions.rb
        def reports
          status = 'SUCCESS'
          data = {
            'Abducted Survivors (%)': abductedPercentage,
            'Safe Survivors (%)': safePercentage,
            'List of Survivors': survivorsAndStatusOrderedAlphabetical
          }
          code = 200
          renderOutput(status,data,code)
        end
      end
    end
  end