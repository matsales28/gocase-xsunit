require_relative 'side_functions'
module Api
  module V1
    class FlagsController < ApplicationController

      # Method to create a flag report
      def create
        survivor = Survivor.find(params[:survivor_id])
        flagger = Survivor.find(params[:flagger_id])
        validator = validateTheFlag(survivor,flagger)
        if validator[:status]
          flag = Flag.new(flag_params)
          flag.save
          flagCount = Flag.where(survivor_id: survivor.id).size 
          if flagCount >= 3
          survivor.update(:status => true)
          end
          status = 'SUCCESS'
          data = {
            message: validator[:message],
            flag: flag,
            flagCount:flagCount
          }
          code = 200
        else
          status = 'ERROR'
          data = {
            message: validator[:message]
          }
          code = 400
        end
        renderOutput(status,data,code)
      end
    end 
  end  
end