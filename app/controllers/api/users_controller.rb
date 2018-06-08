class Api::UsersController < ApplicationController

  def create
    user = JSON.parse(twitter_user_params)
    login_user = User.first_or_create(screen_name: user["screen_name"], name: user["name"], profile_image_url_https: user["profile_image_url_https"])
    render json: {user: login_user}
  end

  def show
      @user = User.find(params[:id])
      @secret_hint = @user.secret_hint
      @hint = @secret_hint.hint

      render json: { user: @user, secret_hint: @secret_hint, hint: @hint }
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
end
