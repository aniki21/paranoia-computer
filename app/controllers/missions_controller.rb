class MissionsController < ApplicationController
  
  # GET /
  # GET /mission/:id
  def show
    @mission_id = params[:id].present? ? params[:id].to_i : 1
    @generic_lines = VoiceLine.generic.order(position: :asc)
    @mission_lines = VoiceLine.for_mission(@mission_id).order(position: :asc)
  end

end
