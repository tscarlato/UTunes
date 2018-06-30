class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :duration
      t.references :cassette, foreign_key: true

      t.timestamps
    end
  end
end
