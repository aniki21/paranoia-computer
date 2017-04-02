class MissionsController < ApplicationController
  
  # GET /
  # GET /mission/:id
  def show
    @mission_id = params[:m].present? ? params[:m].to_i : 1
    @generic_lines = VoiceLine.generic
    @mission_lines = VoiceLine.for_mission(@mission_id)
  end

end
