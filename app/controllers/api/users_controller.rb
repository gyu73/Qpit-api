class Api::UsersController < ApplicationController

  def create
    user = JSON.parse(twitter_user_params)
    login_user = User.where(screen_name: user["screen_name"], name: user["name"], profile_image_url_https: user["profile_image_url_https"]).first_or_create
    if !Hint.where(user_id: login_user.id).exists?
      hint = Hint.create(user_id: login_user.id)
      SecretHint.create(user_id: login_user.id, hint_id: hint.id)
    end
    render json: {user: login_user}
  end

  def registerLikePerson
    login_user = User.find(register_like_person_params[:id])
    login_user.update(like_person_screen_name: register_like_person_params[:like_person_screen_name])
    login_user_after_update = User.find(register_like_person_params[:id])
    like_person = User.where(screen_name: login_user_after_update.like_person_screen_name)
    # 好きな人が存在すれば、画像も埋め込む。
    if like_person.exists?
      login_user_after_update.update(like_person_twitter_profile_image: like_person[0].profile_image_url_https)
    end
      render json: { user: login_user_after_update }
  end

  def getLikePersonNormalHint
    hint_content = request.query_parameters["content"]
    login_user_id = get_like_person_hint_params["id"]
    login_user = User.find(login_user_id)
    like_person_screen_name = login_user.like_person_screen_name
    like_person = User.where(screen_name: like_person_screen_name)[0]
    answer = "ハズレだよ"
    # 好きな人のユーザーが存在する時
    if like_person
        like_person_normal_hints = Hint.find(like_person.id)
        # 答えが空のときは"ハズレだよ"を返す
        answer = !like_person_normal_hints[hint_content].empty? ? like_person_normal_hints[hint_content] : "ハズレだよ"
    end
    render json: {answer: answer}
  end

  def getLikePersonSecretHint
    hint_content = request.query_parameters["content"]
    login_user_id = get_like_person_hint_params["id"]
    login_user = User.find(login_user_id)
    like_person_screen_name = login_user.like_person_screen_name
    like_person = User.where(screen_name: like_person_screen_name)[0]
    answer = "ハズレだよ"
    # 好きな人のユーザーが存在する時 && 両思いの時
    if like_person && like_person.like_person_screen_name == login_user.screen_name
        like_person_secret_hints = SecretHint.find(like_person.id)
        # 答えが空のときは"ハズレだよ"を返す
        answer = !like_person_secret_hints[hint_content].empty? ? like_person_secret_hints[hint_content] : "ハズレだよ"
    end
    render json: {answer: answer}
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    Hint.update(params[:id], has_like_person: nil, belongs_to_club: nil, club: nil, hair_style: nil, clothing: nil, height: nil, personality: nil, age: nil, school: nil, company: nil, favorite_phrase: nil, like_food: nil, like_music: nil, hobby: nil, like_subject: nil, hate_subject: nil, has_spoken: nil)
    SecretHint.update(params[:id], classroom: nil, like_person_initial: nil, familiar: nil, contact_line: nil, like_person_nickname: nil, first_meeting: nil)
    render json: user
  end

  private
    def twitter_user_params
      params.require(:user)
    end

    def register_like_person_params
      {like_person_screen_name: params.permit(:like_person_screen_name)["like_person_screen_name"], id: params.permit(:id)["id"]}
    end

    def get_like_person_hint_params
      params.permit(:id)
    end
end
