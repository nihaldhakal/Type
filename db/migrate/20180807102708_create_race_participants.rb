class CreateRaceParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :race_participants do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :typed_text
      t.integer :total_key_stroke
      t.integer :wpm
      t.integer :accuracy

      t.timestamps
    end
  end
end
