class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.string   :has_like_person
      t.string   :belong_to_club
      t.string   :club
      t.string   :hair_style
      t.string   :clothing
      t.string   :height
      t.string   :personality
      t.string   :age
      t.string   :school
      t.string   :company
      t.string   :favorite_phrase
      t.string   :like_food
      t.string   :like_music
      t.string   :hobby
      t.string   :like_subject
      t.string   :hate_subject
      t.string   :has_spoken
      t.integer  :user_id

      t.timestamps
    end
  end
end
