# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(screen_name: 'zWQmwP4sF2XcwVy', name: '田岡雅規', profile_image_url_https: 'https://pbs.twimg.com/profile_images/828128360794501122/7I5ha6Up_400x400.jpg', like_person_screen_name: 'H1aXr', like_person_twitter_profile_image: 'https://pbs.twimg.com/profile_images/994149082338803713/UGhh_hkq_400x400.jpg', last_shoot_time: '14:00:00', stock_arrow: '1', coming_arrow_number: '1')
Hint.create(has_like_person: 'おる', belong_to_club: '入っている', club: 'サッカー部', hair_style: 'ソフトモヒカン', clothing: 'カジュアル', height: '171cm', personality: '面白い', age: '19', school: '山本高校', company: 'ローソン', favorite_phrase: 'ムキムキなところ', like_food: 'カレー', like_music: 'ゆず', hobby: 'サッカー', like_subject: '社会', hate_subject: '家庭科', has_spoken: 'ある', user_id: '12')
SecretHint.create(like_person_initial: 'R.S', classroom: '7組', familiar: '仲良い', contact_line: 'LINEしてる', like_person_nickname: 'pitくん', first_meeting: '入学式', user_id: '12', hint_id: '12')