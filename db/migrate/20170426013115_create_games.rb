class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.string :location
      t.string :date

      t.timestamps
    end
  end
end
