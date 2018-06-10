# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(screen_name: 'Ryota Shiono', name: 'H1aXr', profile_image_url_https: 'https://pbs.twimg.com/profile_images/994149082338803713/UGhh_hkq_400x400.jpg', like_person_screen_name: '田岡雅規', like_person_twitter_profile_image: 'https://pbs.twimg.com/profile_images/828128360794501122/7I5ha6Up_400x400.jpg', last_shoot_time: '12:00:00', stock_arrow: '1', coming_arrow_number: '2')
Hint.create(has_like_person: 'いる', belong_to_club: '入っている', club: 'テニス部', hair_style: 'ショートカット', clothing: 'カジュアル', height: '156cm', personality: '優しい', age: '19', school: '山本高校', company: 'セブンイレブン', favorite_phrase: '笑顔が素敵がところ' like_food: 'コロッケ', like_music: 'greeeen', hobby: 'ランニング', like_subject: '数学', hate_subject: '社会', has_spoken: 'ある', user_id: '1')
SecretHint.create(like_person_initial: 'M.K', classroom: '6組', familiar: '親しです', contact_line: 'LINEしてる', like_person_nickname: 'Qちゃん', first_meeting: '入学式', user_id: '1', hint_id: '1')