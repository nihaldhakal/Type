class RaceParticipantsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_participant, only: [:update]
  before_action :set_race, only: [:new, :show]

  def new
  end

  def show
  end

  # POST /race_participants
  # POST /race_participants.json
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

def set_race
  @race = Race.order("RANDOM()").first
end

def race_participant_params
  params.require(:race_participant).permit(:total_key_stroke)
end
def set_participant
  @race_participant = RaceParticipant.find(params[:id])
end
