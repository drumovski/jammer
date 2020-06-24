class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :program
      t.integer :order
      t.text :notes
      t.text :lyrics
      t.integer :tempo
    end
  end
end
