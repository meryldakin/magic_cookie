class AddResultToGameFortunes < ActiveRecord::Migration[5.0]
  def change
    add_column :game_fortunes, :result, :string
  end
end
