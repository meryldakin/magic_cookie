class CreateGameFortunes < ActiveRecord::Migration[5.0]
  def change
    create_table :game_fortunes do |t|
      t.integer :game_id
      t.integer :fortune_id

    end
  end
end
