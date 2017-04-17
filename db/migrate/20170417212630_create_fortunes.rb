class CreateFortunes < ActiveRecord::Migration[5.0]
  def change
    create_table :fortunes do |t|
      t.text :proverb
    end
  end
end
