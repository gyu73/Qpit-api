class CreateSecretHints < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_hints do |t|
      t.string   :like_person_initial, default: ''
      t.string   :classroom, default: ''
      t.string   :familiar, default: ''
      t.string   :contact_line, default: ''
      t.string   :like_person_nickname, default: ''
      t.string   :first_meeting, default: ''
      t.integer  :user_id
      t.integer  :hint_id

      t.timestamps
    end
  end
end
