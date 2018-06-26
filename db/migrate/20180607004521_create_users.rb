class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :screen_name
      t.string  :name
      t.string  :profile_image_url_https
      t.string  :like_person_screen_name, default: ''
      t.string  :like_person_twitter_profile_image, default: ''
      t.datetime    :last_shoot_time, default: Time.now
      t.integer :stock_arrow, default: 1
      t.integer :coming_arrow_number, default: 0
      t.boolean :login, default: true
      t.boolean :like_person_exists, default: false

      t.timestamps
    end
  end
end
