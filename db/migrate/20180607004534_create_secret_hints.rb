class CreateSecretHints < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_hints do |t|
      t.string   :like_person_screen_name
      t.string   :classroom
      t.string   :familiar
      t.string   :contact_line
      t.string   :like_person_nickname
      t.string   :first_meeting
      t.integer  :user_id
      t.integer  :hint_id

      t.timestamps
    end
  end
end
