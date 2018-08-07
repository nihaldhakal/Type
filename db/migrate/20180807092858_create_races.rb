class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.text :value
      t.string :description

      t.timestamps
    end
  end
end
