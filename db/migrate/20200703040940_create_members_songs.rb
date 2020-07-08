class CreateMembersSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :members_songs do |t|
      t.references :song, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
