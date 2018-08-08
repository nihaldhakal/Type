class RaceParticipantsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST /race_participants
  # POST /race_participants.json
  before_action :set_race, only: [:update]
  def new
    @race=Race.order("RANDOM()").first
  end
  def create
    @race_participant = RaceParticipant.new(race_participant_params)
    if @race_participant.save
      render json: @race_participant, status: :created
    else
      render json: @race_participant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /race_participants/1
  # PATCH/PUT /race_participants/1.json
  def update
    if @race_participant.update(race_participant_params)
      render json: @race_participant, status: :ok
    else
      render json: @race_participant.errors, status: :unprocessable_entity
    end
  end
end
private

def race_participant_params
  params.require(:race_participant).permit(:total_key_stroke)
end
def set_race
  @race_participant = RaceParticipant.find(params[:id])
end