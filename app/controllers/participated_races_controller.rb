class ParticipatedRacesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_participant, only: [:update]
  before_action :set_race, only: [:new, :show]

  def index
    @participated_races=ParticipatedRace.order(created_at: :desc).limit(5)
    # render json: ParticipatedRace.all, status: :ok
  end

  def new
    @race = Race.order("RANDOM()").first
    @race = Race.new(value: 'Be the chief but never the lord.')
    @playing_as_guest = current_user.blank?
  end

  def show
  end

  # POST /ParticipatedRaces
  # POST /ParticipatedRaces.json
  def create
    new_object_params = participated_race_params
    # new_object_params[:start_time] = Time.at(new_object_params[:start_time])
    # new_object_params[:end_time] = Time.at(new_object_params[:end_time])
    new_object_params[:start_time] = DateTime.parse(new_object_params[:start_time])
    new_object_params[:end_time] = DateTime.parse(new_object_params[:end_time])
    @participated_race = ParticipatedRace.new(new_object_params)
    if @participated_race.save
      render json: @participated_race, status: :created
    else
      render json: @participated_race.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ParticipatedRaces/1
  # PATCH/PUT /ParticipatedRaces/1.json
  def update
    if @participated_race.update(participated_race_params)
      render json: @participated_race, status: :ok
    else
      render json: @participated_race.errors, status: :unprocessable_entity
    end
  end
end

private

def set_race

end

def participated_race_params
  params.require(:participated_race).permit(:total_key_stroke, :accuracy, :wpm, :typed_text, :start_time, :end_time)
end
def set_participant
  @participated_race = ParticipatedRace.find(params[:id])
end
