class RaceParticipantsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_participant, only: [:update]
  before_action :set_race, only: [:new, :show]

  def index
    @race_participants=RaceParticipant.order(created_at: :desc).limit(5)
    # render json: RaceParticipant.all, status: :ok
  end

  def new
    @race = Race.order("RANDOM()").first
    @race = Race.new(value: 'aaa')

  end

  def show
  end

  # POST /race_participants
  # POST /race_participants.json
  def create
    new_object_params = race_participant_params
    # new_object_params[:start_time] = Time.at(new_object_params[:start_time])
    # new_object_params[:end_time] = Time.at(new_object_params[:end_time])
    new_object_params[:start_time] = DateTime.parse(new_object_params[:start_time])
    new_object_params[:end_time] = DateTime.parse(new_object_params[:end_time])
    @race_participant = RaceParticipant.new(new_object_params)
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

end

def race_participant_params
  params.require(:race_participant).permit(:total_key_stroke, :accuracy, :wpm, :typed_text, :start_time, :end_time)
end
def set_participant
  @race_participant = RaceParticipant.find(params[:id])
end
