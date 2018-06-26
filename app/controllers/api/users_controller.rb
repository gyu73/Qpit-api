class Api::UsersController < ApplicationController

  def getUserInfo
    login_user = User.find(get_user_info_params[:id])
    render json: {user: login_user}
  end

  def create
    user = JSON.parse(twitter_user_params)
    login_user = User.where(screen_name: user["screen_name"], name: user["name"], profile_image_url_https: user["profile_image_url_https"]).first_or_create
    if !Hint.where(user_id: login_user.id).exists?
      hint = Hint.create(user_id: login_user.id)
      SecretHint.create(user_id: login_user.id, hint_id: hint.id)
    end
    login_user.update(login: true)
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
    else
      login_user_after_update.update(like_person_twitter_profile_image: "https://pbs.twimg.com/profile_images/1006101721024610305/G302QDgO_400x400.jpg")
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
        update_coming_arrow_number = 1 + like_person.coming_arrow_number
        like_person.update(coming_arrow_number: update_coming_arrow_number)
    end
    update_stock_arrow = login_user.stock_arrow - 1
    login_user.update(stock_arrow: update_stock_arrow, last_shoot_time: Time.now)
    render json: {user: login_user, answer: answer}
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
        update_coming_arrow_number = 1 + like_person.coming_arrow_number
        like_person.update(coming_arrow_number: update_coming_arrow_number)
    end
    update_stock_arrow = login_user.stock_arrow - 1
    login_user.update(stock_arrow: update_stock_arrow, last_shoot_time: Time.now)
    render json: {user: login_user, answer: answer}
  end

  def logout
    login_user = User.find(delete_params["id"])
    login_user.update(login: false)
  end

  def delete
    login_user = User.find(delete_params["id"])
    login_user.destroy
  end

  def getArrow
    login_user = User.find(get_arrow_params["id"])
    login_user.update(stock_arrow: 1)
    render json: login_user
  end

  private
    def get_user_info_params
      params.permit(:id)
    end

    def twitter_user_params
      params.require(:user)
    end

    def register_like_person_params
      {like_person_screen_name: params.permit(:like_person_screen_name)["like_person_screen_name"], id: params.permit(:id)["id"]}
    end

    def get_like_person_hint_params
      params.permit(:id)
    end

    def delete_params
      params.permit(:id)
    end

    def get_arrow_params
      params.permit(:id)
    end
end
