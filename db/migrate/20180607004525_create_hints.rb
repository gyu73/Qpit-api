class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.string   :has_like_person, default: ''
      t.string   :belong_to_club, default: ''
      t.string   :club, default: ''
      t.string   :hair_style, default: ''
      t.string   :clothing, default: ''
      t.string   :height, default: ''
      t.string   :personality, default: ''
      t.string   :age, default: ''
      t.string   :school, default: ''
      t.string   :company, default: ''
      t.string   :favorite_phrase, default: ''
      t.string   :like_food, default: ''
      t.string   :like_music, default: ''
      t.string   :hobby, default: ''
      t.string   :like_subject, default: ''
      t.string   :hate_subject, default: ''
      t.string   :has_spoken, default: ''
      t.integer  :user_id

      t.timestamps
    end
  end
end
